import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/bottomSwitcher/PostItem.dart';

import '../Classes/Post.dart';

class SavedPosts extends StatefulWidget {
  SavedPosts({this.savedPosts});
  List<Post> savedPosts;
  @override
  State<SavedPosts> createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Posts"),
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: widget.savedPosts.length,
        itemBuilder: (context,index){
          return PostItem(post: widget.savedPosts.elementAt(index));
        },
      ),
    );
  }
}
