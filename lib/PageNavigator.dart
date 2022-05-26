import 'dart:html';

import 'package:flutter/material.dart';
import 'package:test_mu/bottomSwitcher/comment.dart';
import 'package:test_mu/bottomSwitcher/notifications.dart';
import 'package:test_mu/bottomSwitcher/home.dart';
import 'package:test_mu/bottomSwitcher/add.dart';
import 'package:test_mu/bottomSwitcher/search.dart';
import 'package:test_mu/bottomSwitcher/switcherModel.dart';
import 'package:test_mu/main.dart';

import 'Classes/Post.dart';
import 'Classes/User.dart';
class BottomSwitcher extends StatefulWidget {

  @override
  State<BottomSwitcher> createState() => _BottomSwitcherState();
}

class _BottomSwitcherState extends State<BottomSwitcher> {
  int index = 0;
  static List<Widget> _swithcerView = [
    Home(mainUser: mainUser,),
    Search(),
    Add(mainUser: users[1],),
    Comment(),
    Notifications(),
  ];

  void _onTapNavigationItemBar(int i){
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    users[1].posts.add(new Post(owner: users[1], imageDirectory: 'assets/google.png', caption: "caption1"));
    users[1].posts.add(new Post(owner: users[1], imageDirectory: "assets/github.png", caption: "caption2"));
    mainUser.following.add(users[1]);
    users[1].followers.add(mainUser);
    return Scaffold(
      body: Center(
        child: _swithcerView.elementAt(index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: index,
        onTap: _onTapNavigationItemBar,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: _SwitcherItems.map((e) =>
          BottomNavigationBarItem(
              icon: Icon(e.icon),
            activeIcon: Icon(e.activeIcon),
            label: e.title,
          )
        ).toList(),
        ),
      );
  }
}
List<SwitcherModel> _SwitcherItems = [
  SwitcherModel(
    icon: Icons.home_outlined,
    activeIcon: Icons.home,
    title: "Home",
  ),
  SwitcherModel(
    icon: Icons.search,
    activeIcon: Icons.search_sharp,
    title: "Search",
  ),
  SwitcherModel(
    icon: Icons.add_circle_outline,
    activeIcon: Icons.add_circle,
    title: "New post",
  ),
  SwitcherModel(
    icon: Icons.comment_outlined,
    activeIcon: Icons.comment,
    title: "Comments",
  ),
  SwitcherModel(
    icon: Icons.notifications_none_outlined,
    activeIcon: Icons.notifications,
    title: "Notification",
  ),
];
List<User> users = [
  new User(
    firstName: "firstName1",
    lastName: "lastName1",
    password: "password",
    username: "username1",
    avatarDirectory: "assets/avatars/avatar.jpg"
  ),
  new User(
      firstName: "firstName2",
      lastName: "lastName2",
      password: "password",
      username: "username2",
      avatarDirectory: "assets/avatars/avatar.jpg",
  )
];
User mainUser = users[0];