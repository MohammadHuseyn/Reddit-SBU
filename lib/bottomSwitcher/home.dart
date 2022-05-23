import 'package:flutter/material.dart';
import 'package:test_mu/bottomSwitcher/PostItem.dart';

import '../Classes/User.dart';
class Home extends StatelessWidget {
  Home({this.users});
  List<User> users;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
            itemCount: users.elementAt(0).posts.length,
            itemBuilder: (context,index){
              return PostItem(post: users.elementAt(0).posts.elementAt(index),);
        },
      ),
    );
  }
}
