import 'package:flutter/material.dart';
class User {
  final int id = DateTime.now().millisecondsSinceEpoch;
  String username;
  String firstName;
  String lastName;
  String password;
  List<User> following = [];
  List<User> followers = [];
  List</*TODO: make post file*/> posts = [];
  final DateTime dateJoined = DateTime.now();

  User({
    this.username,
    this.firstName,
    this.lastName,
    this.password,
});

}