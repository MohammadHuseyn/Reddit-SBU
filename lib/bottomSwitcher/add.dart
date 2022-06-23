import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'addComminuty.dart';
import '../Classes/User.dart';
import 'addPost.dart';

class Add extends StatefulWidget {
  Add({this.mainUser});

  User mainUser;

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text("Select Comminuty or post"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddComminuty(
                                    mainUser: widget.mainUser,
                                  )));
                    },
                    style:
                        ElevatedButton.styleFrom(padding: EdgeInsets.all(30),
                        primary: Colors.white),
                    child: Text(
                      "Comminuty",
                      style: TextStyle(fontSize: 20,color: Colors.black),
                    ))),
            SizedBox(
              height: 50,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(30),
                  primary: Colors.white),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddPost(
                                  mainUser: widget.mainUser,
                                )));
                  },
                  child: Text(
                    "Post",
                    style: TextStyle(fontSize: 20,color: Colors.black),
                  )),
            ),
          ],
        ));
  }
}
