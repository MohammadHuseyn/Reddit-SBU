import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/Classes/CommentClass.dart';
import 'package:test_mu/PageNavigator.dart';
import 'package:test_mu/bottomSwitcher/CommentItem.dart';

import '../Classes/Post.dart';

class PostDetails extends StatefulWidget {
  PostDetails({this.post, this.ago});

  String ago;
  Post post;

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  var textFieldcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textFieldcontroller.text = "";
    return Scaffold(
      appBar: AppBar(title: Text(widget.post.owner.username + " 's post"),backgroundColor: Colors.black,),
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(30),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "caption: ",
                    style: TextStyle(fontSize: 20, color: Colors.white54),
                  ),
                  TextSpan(
                      text: widget.post.caption + "\n\n",
                      style: TextStyle(fontSize: 20)),
                  TextSpan(
                      text: widget.ago,
                      style: TextStyle(color: Colors.white54, fontSize: 15))
                ]))),
            // Image.asset(post.imageDirectory),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                controller: textFieldcontroller,
                style: TextStyle(),
                decoration: InputDecoration(
                    hintText: "Add a comment",
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        setState(() {
                          if (textFieldcontroller.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Field can not be empty"),
                            ));
                          } else
                            widget.post.comments.add(CommentClass(
                                comment: textFieldcontroller.text,
                                owner: mainUser,
                                onPost: widget.post));
                        });
                      },
                    )),
              ),
            ),
            Container(
              height: 700,
              child: ListView.builder(
                itemCount: widget.post.comments.length,
                itemBuilder: (context, index) {
                  return CommentItem(
                    comment: widget.post.comments.elementAt(index),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
