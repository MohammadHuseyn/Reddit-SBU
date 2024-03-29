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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black54,
          title: Text("Select Comminuty or post"),
        ),
        body: Row(
          children: [
            GestureDetector(
              child: Container(
                color: Colors.green,
                width: MediaQuery.of(context).size.width / 2,
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "POST",
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                        Icon(Icons.post_add,size: 40,color: Colors.white,)
                      ],
                    )),
              ),
              onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddPost(
              mainUser: widget.mainUser,
            ))),
            ),
            GestureDetector(
              child: Container(
                color: Colors.deepOrangeAccent,
                width: MediaQuery.of(context).size.width / 2,
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                  "COMMINUTY",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
                        Icon(Icons.group_add,size: 40,color: Colors.white)
                      ],
                    )),
              ),
              onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddComminuty(
                                    mainUser: widget.mainUser,
                                  ))),
            ),
          ],
        )
        // Column(
        //   children: [
        //     SizedBox(
        //       height: 50,
        //     ),
        //     Center(
        //         child: ElevatedButton(
        //             onPressed: () {
        //               Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => AddComminuty(
        //                         mainUser: widget.mainUser,
        //                       )));
        //             },
        //             style:
        //             ElevatedButton.styleFrom(padding: EdgeInsets.all(30),
        //                 primary: Colors.white),
        //             child: Text(
        //               "Comminuty",
        //               style: TextStyle(fontSize: 20,color: Colors.black),
        //             ))),
        //     SizedBox(
        //       height: 50,
        //     ),
        //     Center(
        //       child: ElevatedButton(
        //           style: ElevatedButton.styleFrom(padding: EdgeInsets.all(30),
        //               primary: Colors.white),
        //           onPressed: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => AddPost(
        //                       mainUser: widget.mainUser,
        //                     )));
        //           },
        //           child: Text(
        //             "Post",
        //             style: TextStyle(fontSize: 20,color: Colors.black),
        //           )),
        //     ),
        //   ],
        // )
        );
  }
}
