import 'dart:html';

import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Community.dart';
import 'package:test_mu/bottomSwitcher/comment.dart';
import 'package:test_mu/bottomSwitcher/settings.dart';
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
    Settings(),
  ];

  void _onTapNavigationItemBar(int i){
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    Community community = new Community(owner: mainUser, avatarDirectory: 'assets/google.png',descriptoin: "desc", name: "my Comminuty");
    mainUser.communities.add(community);
    users[1].communities.add(community);
    users[2].communities.add(community);
       mainUser.communities[0].following.add(users[1]);
       mainUser.communities[0].following.add(users[2]);
       users[1].communities[0].posts.add(new Post(owner: users[1], imageDirectory: "assets/google.png", caption: "caption3"));
       users[2].communities[0].posts.add(new Post(owner: users[2], imageDirectory: "assets/google.png", caption: "caption3"));
       users[1].communities[0].posts[0].date = DateTime(2022,3,1);
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
    icon: Icons.settings,
    activeIcon: Icons.settings,
    title: "Settings",
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
  ),
  new User(
    firstName: "firsname3",
    lastName: "lastname3",
    password: "password",
    username: "username3",
    avatarDirectory: "assets/avatars/google.png",
  )
];
User mainUser = users[0];