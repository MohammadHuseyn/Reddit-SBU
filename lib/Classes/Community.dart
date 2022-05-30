import 'package:flutter/material.dart';
import 'Post.dart';
import 'User.dart';
import 'Post.dart';
class Community{
  final int id = DateTime.now().millisecondsSinceEpoch; // unchangeable
  String name;
  String descriptoin;
  String avatarDirectory;
  User owner;
  List<User> admins = [];
  List<Post> posts = [];
  List<User> following = []; // is empty at first
  List<User> followers = [];
  final DateTime dateCreated = DateTime.now(); // unchangeable
  Community({
    this.owner,
    this.name,
    this.descriptoin,
    this.avatarDirectory,
  });
}