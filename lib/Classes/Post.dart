import 'package:flutter/material.dart';
import 'User.dart';
import 'Community.dart';
import 'CommentClass.dart';
class Post {
  final int id = DateTime.now().millisecondsSinceEpoch; // unchangeable
  String caption;
  // String imageDirectory;
  Community community;
  List<User> disliked = []; // is empty at first
  List<User> liked = []; // is empty at first
  List<CommentClass> comments = []; // is empty at first
  User owner;
  DateTime date = DateTime.now(); // unchangeable

  Post({
    this.caption,         // nothing
    // this.imageDirectory,  // can be
    this.owner,           // empty
    this.community,
});
  String get getCaption => caption;
  // String get getImageDirectory => imageDirectory;
  List<User> get getDisliked => disliked;
  List<User> get getLiked => disliked;
  List<CommentClass> get getComments => comments;
  set setCaption (String value){
    caption = value;
  }
  // set setImageDirectory(String value){
  //   imageDirectory = value;
  // }
}