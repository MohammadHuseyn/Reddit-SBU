import 'dart:html';

import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Post.dart';

class PostItem extends StatelessWidget {
  PostItem({this.post});

  Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              child: ListTile(
                title: Text(post.owner.username,style: TextStyle(color: Colors.white),),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/google.png'),
                ),
              ),
            ),
            Container(
              child: Image(
                image: AssetImage(post.imageDirectory), fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Liked"),
                            ));
                          },
                          child: Icon(Icons.thumb_up_alt_rounded),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black54,
                            padding: EdgeInsets.all(18)
                        ),
                      ),
                      SizedBox(width: 25,),
                      ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Disliked"),
                            ));
                          },
                          child: Icon(Icons.thumb_down),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black54,
                            padding: EdgeInsets.all(18)
                        ),
                      ),SizedBox(width: 25,),
                      ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Comments"),
                            ));
                          },
                          child: Icon(Icons.comment),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black54,
                            padding: EdgeInsets.all(18)
                        ),
                      ),SizedBox(width: 25,),
                      ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("shared"),
                            ));
                          },
                          child: Icon(Icons.send),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black54,
                          padding: EdgeInsets.all(18)
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: RichText(
                      text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: post.owner.firstName + ": ",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 15,
                                )),
                             TextSpan(text: post.caption,
                                style: TextStyle(color: Colors.white, fontSize: 17)),
                          ]
                      ),
                    ),
                  ),
                  Container(
                    child: Divider(color: Colors.white12,),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}