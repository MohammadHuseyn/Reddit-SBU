import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Community.dart';
import 'package:test_mu/PageNavigator.dart';
import 'package:test_mu/main.dart';

import '../Classes/User.dart';
import 'PostItem.dart';

class SearchResult extends StatefulWidget {
  SearchResult({this.mainUser,this.communities, this.query});

  List<Community> communities;
  String query;
  User mainUser;
  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  String str ="Unkown";
  @override
  Widget build(BuildContext context) {

    // TODO: implement buildResults
    Community community;
    for (int i = 0; i < widget.communities.length; i++) {
      if (widget.communities
          .elementAt(i)
          .name == widget.query) {
        community = widget.communities.elementAt(i);
        break;
      }
    }
    str = mainUser.communities.contains(community)?"UnFollow":"Follow";
    changeFollow(){
      setState(() {
        bool flag = mainUser.communities.contains(community);
        str = flag?"UnFollow":"Follow";
        if (flag)
          mainUser.communities.removeAt(mainUser.communities.indexOf(community));
        else mainUser.communities.add(community);
      });
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
                  // ClipOval(
                  //   child: Image.asset(
                  //     community.avatarDirectory,
                  //     width: 175,
                  //   ),
                  // ),
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
                    color: Colors.white))),
        ElevatedButton(
            onPressed: () {
              changeFollow();
            }, child: Text(str)),
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
    ]
    ,
    )
    )
    );
  }
}
