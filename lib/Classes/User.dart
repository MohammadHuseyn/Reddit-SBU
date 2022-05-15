import 'package:flutter/material.dart';
import 'Post.dart';
class User {
  final int id = DateTime.now().millisecondsSinceEpoch; // unchangeable
  String username; // need to be unique
  String firstName;
  String lastName;
  String password; // need a double check
  List<User> following = []; // is empty at first
  List<User> followers = []; // is empty at first
  List<Post> posts = []; // is empty at first
  final DateTime dateJoined = DateTime.now(); // unchangeable

  User({
    this.username,  //
    this.firstName, // nothing
    this.lastName,  // can be
    this.password,  // empty
});

}