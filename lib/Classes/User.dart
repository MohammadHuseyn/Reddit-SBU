import 'package:flutter/material.dart';
import 'Post.dart';
import 'Community.dart';
class User {
  final int id = DateTime.now().millisecondsSinceEpoch; // unchangeable
  String username; // need to be unique
  String firstName;
  String lastName;
  String password; // need a double check
  // is empty at first
  List<Community> communities = []; // is empty at first
  String avatarDirectory;
  final DateTime dateJoined = DateTime.now(); // unchangeable

  User({
    this.username,  //
    this.firstName, // nothing
    this.lastName,  // can be
    this.password,  // empty
    this.avatarDirectory,
  });
  // getters; can't get password
  int get getId => id;
  String get getFirstName => firstName;
  String get getLastName => lastName;
  String get getFullName => firstName + " " + lastName;
  String get getUsername => username;
  String get getAvatarDirectory => avatarDirectory;
  //setters; can't set id, followers, followings, posts, logedIn
  set setFirstName (String value){
    firstName = value;
  }
  set setLastName (String value){
    lastName = value;
  }
  set setUserName (String value){
    username = value;
  }
  set setAvatarDirectory (String value){
    avatarDirectory = value;
  }
  //methods

  Post newPost ({String caption, String imageDirectory}){
    return Post(
      caption: caption,
      imageDirectory: imageDirectory,
      owner: this,
    );
  }

}