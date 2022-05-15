import 'package:flutter/material.dart';
import 'package:test_mu/bottomSwitcher/comment.dart';
import 'package:test_mu/bottomSwitcher/notifications.dart';
import 'package:test_mu/bottomSwitcher/home.dart';
import 'package:test_mu/bottomSwitcher/add.dart';
import 'package:test_mu/bottomSwitcher/search.dart';
class BottomSwitcher extends StatefulWidget {

  @override
  State<BottomSwitcher> createState() => _BottomSwitcherState();
}

class _BottomSwitcherState extends State<BottomSwitcher> {
  int index = 0;
  static List<Widget> _swithcerView = [
    Home(),
    Search(),
    Add(),
    Comment(),
    Notifications(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
