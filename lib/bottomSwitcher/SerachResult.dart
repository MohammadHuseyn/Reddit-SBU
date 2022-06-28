import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Community.dart';
import 'package:test_mu/PageNavigator.dart';
import 'package:test_mu/main.dart';

import '../Classes/User.dart';
import 'PostItem.dart';

class SearchResult extends StatefulWidget {
  SearchResult({this.mainUser, this.communities, this.query});

  List<Community> communities;
  String query;
  User mainUser;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  String str = "Unkown";

  @override
  Widget build(BuildContext context) {
    // TODO: implement buildResults
    Community community;
    for (int i = 0; i < widget.communities.length; i++) {
      if (widget.communities.elementAt(i).name == widget.query) {
        community = widget.communities.elementAt(i);
        break;
      }
    }
    str = mainUser.communities.contains(community) ? "UnFollow" : "Follow";
    changeFollow() {
      setState(() {
        bool flag = mainUser.communities.contains(community);
        str = flag ? "UnFollow" : "Follow";
        if (flag)
          mainUser.communities
              .removeAt(mainUser.communities.indexOf(community));
        else
          mainUser.communities.add(community);
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          community.owner.username,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 50,
                child: ListView.builder(
                  itemCount: community.posts.length,
                  itemBuilder: (context, index) {
                    return PostItem(
                      post: community.posts.elementAt(index),
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 50),
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.amber,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text("Comminuty detail")),
          )
        ],
      ),
    );
  }
}
