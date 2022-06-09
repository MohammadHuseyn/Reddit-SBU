import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/bottomSwitcher/CommentItem.dart';

import '../Classes/Post.dart';

class PostDetails extends StatelessWidget {
  PostDetails({this.post});

  Post post;
  TextEditingController textFieldcontroller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.owner.username)),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Image.asset(post.imageDirectory),
            Divider(
              color: Colors.black,
            ),
            TextField(
              controller: textFieldcontroller,
              style: TextStyle(

              ),
              decoration: InputDecoration(
                hintText: "Add a comment",
              ),
            ),
            Divider(color: Colors.black,),
            Container(
              height: 700,
              child: ListView.builder(
                itemCount: post.comments.length,
                itemBuilder: (context,index){
                  return CommentItem(comment: post.comments.elementAt(index),);
                },
              ),
            )
        ],
      ),
          )),
    );
  }
}
