import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Community.dart';
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

class Home extends StatefulWidget {
  Home({this.mainUser});
  User mainUser;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.black,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: widget.mainUser.communities.length,
              itemBuilder: (context, i)  {
                return loop(widget.mainUser.communities.elementAt(i),context);
              }),
        ),
    );
    }
}
