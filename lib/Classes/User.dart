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
  bool logedIn = false;
  final DateTime dateJoined = DateTime.now(); // unchangeable

  User({
    this.username,  //
    this.firstName, // nothing
    this.lastName,  // can be
    this.password,  // empty
});
  // getters; can't get password
  int get getId => id;
  String get getFirstName => firstName;
  String get getLastName => lastName;
  String get getFullName => firstName + " " + lastName;
  String get getUsername => username;
  List<User> get getFollowing => following;
  List<User> get getFollowers => followers;
  List<Post> get getPosts => posts;
  bool get isLogedIn => logedIn;
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
  //methods
  bool logIn (String password){
    if (this.password == password)
      this.logedIn = true;
    else this.logedIn = false;
    return this.logedIn;
  }
  Post newPost ({String caption, String imageDirectory}){
    return Post(
      caption: caption,
      imageDirectory: imageDirectory,
      owner: this,
    );
  }

}