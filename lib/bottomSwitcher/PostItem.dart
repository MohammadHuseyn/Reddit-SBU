import 'dart:html';

import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Post.dart';
class PostItem extends StatelessWidget {
  PostItem({this.post});
  Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: ListTile(
              title: Text(post.owner.username),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/google.png'),
              ),
            ),
            decoration: BoxDecoration(border: Border.all(color: Colors.black38, width: 2)),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () =>
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Comment pressed"),
              ))
                , child: Icon(Icons.comment),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(50,562.5),
                  primary: Colors.blueGrey
                ),
              ),
              Container(
                child: Image(image: AssetImage("assets/google.png"),fit: BoxFit.cover,width: 550,),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38,width: 2)
                ),
              ),
              Column(
                children: [
                  ElevatedButton(onPressed: () =>
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Liked"),
                      ))
                    , child: Icon(Icons.thumb_up_alt_rounded),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(50,281.5),
                      primary: Colors.green,
                    ),
                  ),
                  ElevatedButton(onPressed: () =>
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Disliked"),
                      ))
                    , child: Icon(Icons.thumb_down),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(50,281.5),
                      primary: Colors.brown,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10,),
          Container(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: post.owner.firstName, style: TextStyle(color: Colors.black54,fontSize: 15)),
                  TextSpan(text: ": ",style: TextStyle(color: Colors.black87,fontSize: 15)),
                  TextSpan(text: post.caption, style: TextStyle(color: Colors.black,fontSize: 17)),
                ]
              ),
            ),
          ),
          SizedBox(height: 10,),
        ],
      )
    );
  }
}
