import 'package:flutter/material.dart';
import 'User.dart';
class Post {
  final int id = DateTime.now().millisecondsSinceEpoch; // unchangeable
  String caption;
  String imageDirectory;
  List<User> disliked = []; // is empty at first
  List<User> liked = []; // is empty at first
  List<User> commented = []; // is empty at first
  User owner;
  final DateTime date = DateTime.now(); // unchangeable

  Post({
    this.caption,         // nothing
    this.imageDirectory,  // can be
    this.owner,           // empty
});
}