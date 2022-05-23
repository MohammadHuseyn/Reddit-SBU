import 'dart:html';

import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Post.dart';
class PostItem extends StatelessWidget {
  PostItem({this.post});
  Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(post.owner.username),
      ),
    );
  }
}
