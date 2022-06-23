import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_mu/Authentication/Signup.dart';
import 'package:test_mu/Classes/CommentClass.dart';
import 'package:test_mu/Classes/Post.dart';
import 'package:test_mu/PageNavigator.dart';
import 'CommentItem.dart';
import 'PostDetails.dart';
// import 'comment.dart';

class PostItem extends StatefulWidget {
  PostItem({this.post});

  Post post;

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String ago;
    if (widget.post.date.difference(DateTime.now()).inDays.abs() >= 30)
      ago = (widget.post.date.difference(DateTime.now()).inDays.abs().toInt() %
                      30 +
                  1)
              .toString() +
          " month(s)";
    else if (widget.post.date.difference(DateTime.now()).inDays.abs() >= 7)
      ago = (widget.post.date.difference(DateTime.now()).inDays.abs().toInt() %
                      7 +
                  1)
              .toString() +
          " week(s)";
    else if (widget.post.date.difference(DateTime.now()).inDays.abs() > 0)
      ago = (widget.post.date.difference(DateTime.now()).inDays.abs())
              .toString() +
          " day(s)";
    else if (widget.post.date.difference(DateTime.now()).inHours.abs() > 0)
      ago = (widget.post.date.difference(DateTime.now()).inHours.abs())
              .toString() +
          " hour(s)";
    else if (widget.post.date.difference(DateTime.now()).inMinutes.abs() > 0)
      ago = (widget.post.date.difference(DateTime.now()).inMinutes.abs())
              .toString() +
          " minute(s)";
    else
      ago = (widget.post.date.difference(DateTime.now()).inSeconds.abs())
              .toString() +
          " second(s)";
    ago += " ago, ";
    return Container(
      color: Colors.black87,
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetails(post: widget.post,))),
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              child: ListTile(
                title: Text(
                  widget.post.owner.username,
                  style: TextStyle(color: Colors.white),
                ),
                // leading: CircleAvatar(
                //   backgroundImage: AssetImage('assets/google.png'),
                // ),
              ),
            ),
            // Container(
            //   child: Image(
            //     image: AssetImage(widget.post.imageDirectory),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: RichText(
                      text: TextSpan(
                        text: widget.post.caption + "\n",
                        style:
                        TextStyle(color: Colors.white, fontSize: 17)),),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (widget.post.liked.contains(mainUser)) {
                              for (int i = 0;
                                  i < widget.post.liked.length;
                                  i++) {
                                if (widget.post.liked.elementAt(i) ==
                                    mainUser) {
                                  widget.post.liked.removeAt(i);
                                  break;
                                }
                              }
                            } else if (widget.post.disliked
                                .contains(mainUser)) {
                              for (int i = 0;
                                  i < widget.post.disliked.length;
                                  i++) {
                                if (widget.post.disliked.elementAt(i) ==
                                    mainUser) {
                                  widget.post.disliked.removeAt(i);
                                  break;
                                }
                              }
                              widget.post.liked.add(mainUser);
                            } else
                              widget.post.liked.add(mainUser);
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.thumb_up_alt_rounded,
                              color: widget.post.liked.contains(mainUser)
                                  ? Colors.green
                                  : Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(widget.post.liked.length.toString()),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black54,
                            padding: EdgeInsets.all(18)),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (widget.post.disliked.contains(mainUser)) {
                              for (int i = 0;
                                  i < widget.post.disliked.length;
                                  i++) {
                                if (widget.post.disliked.elementAt(i) ==
                                    mainUser) {
                                  widget.post.disliked.removeAt(i);
                                  break;
                                }
                              }
                            } else if (widget.post.liked.contains(mainUser)) {
                              for (int i = 0;
                                  i < widget.post.liked.length;
                                  i++) {
                                if (widget.post.liked.elementAt(i) ==
                                    mainUser) {
                                  widget.post.liked.removeAt(i);
                                  break;
                                }
                              }
                              widget.post.disliked.add(mainUser);
                            } else
                              widget.post.disliked.add(mainUser);
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.thumb_down,
                              color: widget.post.disliked.contains(mainUser)
                                  ? Colors.red
                                  : Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(widget.post.disliked.length.toString()),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black54,
                            padding: EdgeInsets.all(18)),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Comment(post: widget.post,)),
                          // );
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  scrollable: true,
                                  content: Container(
                                    width: 500,
                                    height: 500,
                                    child: Stack(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: TextField(
                                            controller: controller,
                                            decoration: InputDecoration(
                                                hintText: "Type a comment",
                                                suffixIcon: IconButton(
                                                  icon: Icon(Icons.send),
                                                  onPressed: () {
                                                    setState(() {
                                                      widget.post.comments.add(
                                                          new CommentClass(
                                                              owner: mainUser,
                                                              onPost:
                                                                  widget.post,
                                                              comment:
                                                                  controller
                                                                      .text));
                                                      controller.text = "";
                                                    });
                                                  },
                                                )),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 70),
                                          child: ListView.builder(
                                              itemCount:
                                                  widget.post.comments.length +
                                                      1,
                                              itemBuilder: (context, i) {
                                                if (i == 0)
                                                  return Text(widget
                                                          .post.comments.length
                                                          .toString() +
                                                      " comment(s) are available");
                                                return CommentItem(
                                                  comment: widget.post.comments
                                                      .elementAt(i - 1),
                                                );
                                              }),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Row(
                          children: [
                            Icon(Icons.comment),
                            SizedBox(
                              width: 10,
                            ),
                            Text(widget.post.comments.length.toString()),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black54,
                            padding: EdgeInsets.all(18)),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("shared"),
                            ));
                          });
                        },
                        child: Icon(Icons.send),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black54,
                            padding: EdgeInsets.all(18)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: ago + widget.post.owner.firstName + ": ",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            )),
                      ]),
                    ),
                  ),
                  Container(
                    child: Divider(
                      color: Colors.white12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}