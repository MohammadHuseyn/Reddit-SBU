import 'dart:html';

import 'package:flutter/material.dart';
import 'package:test_mu/bottomSwitcher/CommentItem.dart';
import '../Classes/Post.dart';
class Comment extends StatelessWidget {
  Comment({this.post});
  Post post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: post.comments.length,
        itemBuilder: (context,i) {
          return CommentItem(comment: post.comments.elementAt(i),);
        }
      ),
    );
  }
}
