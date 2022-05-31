import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Community.dart';
import 'package:test_mu/PageNavigator.dart';

import 'PostItem.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();

  Search({this.communities});

  List<Community> communities;
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Explore in communities"),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: MySearchDelegate());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Container(
          child: ListView.builder(
            itemCount: communities.length,
            itemBuilder: (context,i){
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(communities.elementAt(i).avatarDirectory),
                ),
                title: Text(communities.elementAt(i).name),
                subtitle: Text(communities.elementAt(i).descriptoin),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query == "" ? close(context, null) : query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    Community community;
    for (int i = 0; i < communities.length; i++) {
      if (communities.elementAt(i).name == query) {
        community = communities.elementAt(i);
        break;
      }
    }
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Stack(
          children: <Widget>[
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          community.avatarDirectory,
                          width: 175,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(
                                  children: [
                                TextSpan(
                                    text: "Tilte: ",
                                    style: TextStyle(color: Colors.white54)),
                                TextSpan(text: community.name + "\n"),
                                TextSpan(
                                    text: "Description: ",
                                    style: TextStyle(color: Colors.white54)),
                                TextSpan(text: community.descriptoin + "\n"),
                                TextSpan(
                                    text: "Description: ",
                                    style: TextStyle(color: Colors.white54)),
                                TextSpan(text: community.descriptoin + "\n"),
                                TextSpan(
                                    text: "owner: ",
                                    style: TextStyle(color: Colors.white54)),
                                TextSpan(text: community.owner.username + "\n"),
                                TextSpan(
                                    text: "number of followers: ",
                                    style: TextStyle(color: Colors.white54)),
                                TextSpan(
                                    text:
                                        community.followers.length.toString() +
                                            "\n"),
                                TextSpan(
                                    text: "number of posts: ",
                                    style: TextStyle(color: Colors.white54)),
                                TextSpan(
                                    text: community.posts.length.toString() +
                                        "\n"),
                              ],
                                  style: TextStyle(
                                      fontSize: 15,
                                      height: 1.8,
                                      color: Colors.white)))
                        ],
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Container(
                    height: 500,
                    child: ListView.builder(
                        itemCount: community.posts.length,
                        itemBuilder: (context, index) {
                          return PostItem(
                              post: community.posts.elementAt(index));
                        }),
                  ),
                ],
              ),
            ),
          ],
        )));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<Community> searchResults = communities.where((e) {
      final result = e.name.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(searchResults.elementAt(i).name),
          onTap: () {
            query = searchResults.elementAt(i).name;
            showResults(context);
          },
        );
      },
    );
  }
}
