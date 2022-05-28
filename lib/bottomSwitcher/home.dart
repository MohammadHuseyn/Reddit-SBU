import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Post.dart';
import 'package:test_mu/bottomSwitcher/PostItem.dart';

import '../Classes/User.dart';

Container loop(User user) {
  return Container(
    child: ListView.builder(
        itemCount: user.posts.length,
        itemBuilder: (context, index) {
          return PostItem(post: user.posts.elementAt(index));
        }),
    height: 400,
  );
}

class Home extends StatelessWidget {
  Home({this.mainUser});

  User mainUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
          itemCount: mainUser.following.length,
          itemBuilder: (context, i)  {
            return loop(mainUser.following.elementAt(i));
          }),
    );
  }
}
