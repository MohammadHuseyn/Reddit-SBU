import 'dart:math';

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
                                  child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,)),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text("Posts", style: TextStyle(color: Colors.white,fontSize: 25),),
                                    SizedBox(height: 20,),
                                    Text(community.posts.length.toString(), style: TextStyle(color: Colors.white,fontSize: 25),)
                                  ],
                                ),
                                SizedBox(width: 60,),
                                Column(
                                  children: [
                                    Text("Followers",style: TextStyle(color: Colors.white,fontSize: 25),),
                                    SizedBox(height: 20,),
                                    Text(community.followers.length.toString(), style: TextStyle(color: Colors.white,fontSize: 25),)
                                  ],
                                ),
                                SizedBox(width: 60,),
                                Column(
                                  children: [
                                    Text("Admins",style: TextStyle(color: Colors.white,fontSize: 25),),
                                    SizedBox(height: 20,),
                                    Text(community.admins.length.toString(), style: TextStyle(color: Colors.white,fontSize: 25),)
                                  ],
                                ),
                              ],
                            )
                          ],
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
