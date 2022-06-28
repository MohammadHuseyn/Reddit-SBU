import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Community.dart';
import 'package:test_mu/PageNavigator.dart';
import '../Classes/Post.dart';
import '../Classes/User.dart';
import 'PostItem.dart';

class SearchResult extends StatefulWidget {
  SearchResult({this.mainUser, this.communities, this.query,this.community});

  List<Community> communities;
  String query;
  User mainUser;
  Community community;
  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  String str = "Unkown";

  @override
  Widget build(BuildContext context) {
    // TODO: implement buildResults
    Community community = widget.community;
    if(community == null){
      for (int i = 0; i < widget.communities.length; i++) {
        if (widget.communities.elementAt(i).name == widget.query) {
          community = widget.communities.elementAt(i);
          break;
        }
      }
    }
    str = mainUser.communities.contains(community)
        ? "\nUnfollow \n"
        : "\nFollow \n";
    changeFollow() {
      setState(() {
        bool flag = mainUser.communities.contains(community);
        str = flag ? "\nUnfollow \n" : "\nFollow \n";
        if (flag) {
          mainUser.communities
              .removeAt(mainUser.communities.indexOf(community));
          community.followers.remove(mainUser);
        } else {
          mainUser.communities.add(community);
          community.followers.add(mainUser);
        }
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          community.name,
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
                    builder: (context) {
                      return StatefulBuilder(builder: (BuildContext context,
                          StateSetter setState) {
                        return Container(
                          height: 500,
                          color: Colors.indigo,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.rotate(
                                angle: 3 * pi / 2,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_forward_ios_rounded),
                                      color: Colors.white,
                                      onPressed: () => Navigator.pop(context),
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Posts",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        community.posts.length.toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Followers",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        community.followers.length.toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Admins",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        community.admins.length.toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                community.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                community.descriptoin,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "belongs to " + community.owner.username,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  changeFollow();
                                  Navigator.pop(context);
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        str,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      widget.mainUser.communities
                                              .contains(community)
                                          ? Icon(
                                              Icons.clear,
                                              size: 20,
                                            )
                                          : Icon(Icons.check)
                                    ]),
                              )
                            ],
                          ),
                        );
                      });
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
