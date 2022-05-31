import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Community.dart';
import 'package:test_mu/Classes/Post.dart';
import 'package:test_mu/bottomSwitcher/PostItem.dart';

import '../Classes/User.dart';

Container loop(Community community,BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    child: ListView.builder(
        itemCount: community.posts.length,
        itemBuilder: (context, index) {
          return PostItem(post: community.posts.elementAt(index));
        }),
  );
}

class Home extends StatelessWidget {
  Home({this.mainUser});

  User mainUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: mainUser.communities.length,
          itemBuilder: (context, i)  {
            return loop(mainUser.communities.elementAt(i),context);
          }),
    );
  }
}
