import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Community.dart';
import 'package:test_mu/PageNavigator.dart';

import 'PostItem.dart';
import 'SerachResult.dart';

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
      data: ThemeData(backgroundColor: Colors.black54),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Text("Explore in communities"),
          actions: [
            IconButton(
              color: Colors.white,
                onPressed: () {
                  showSearch(context: context, delegate: MySearchDelegate());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Container(
          color: Colors.black12,
          child: ListView.builder(
            itemCount: communities.length,
            itemBuilder: (context, i) {
              return ListTile(
                // leading: CircleAvatar(
                //   backgroundImage:
                //       AssetImage(communities.elementAt(i).avatarDirectory),
                // ),
                title: Text(communities.elementAt(i).name),
                subtitle: Text(communities.elementAt(i).descriptoin),
                onTap: () {
                  showSearch(
                      context: context,
                      delegate: MySearchDelegate(),
                      query: communities.elementAt(i).name);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  String str;

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
    return MaterialApp(home: SearchResult(query: query,communities: communities,mainUser: mainUser,community: null),);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<Community> searchResults = communities.where((e) {
      final result = e.name.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return Container(
      color: Colors.black54,
      child: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(searchResults.elementAt(i).name,style: TextStyle(color: Colors.white),),
            onTap: () {
              query = searchResults.elementAt(i).name;
              showResults(context);
            },
          );
        },
      ),
    );
  }
}
