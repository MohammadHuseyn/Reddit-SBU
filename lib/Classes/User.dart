import 'package:flutter/material.dart';
class User {
  final int id = DateTime.now().millisecondsSinceEpoch;
  String username; // need to be unique
  String firstName;
  String lastName;
  String password; // need a double check
  List<User> following = []; // is empty at first
  List<User> followers = []; // is empty at first
  List</*TODO: make post file*/> posts = []; // is empty at first
  final DateTime dateJoined = DateTime.now(); // no one can change that

  User({
    this.username,  //
    this.firstName, // nothing
    this.lastName,  // can be
    this.password,  // empty
});

}