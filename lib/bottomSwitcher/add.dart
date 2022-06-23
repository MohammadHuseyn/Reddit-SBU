import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Community.dart';
import 'package:test_mu/Classes/Post.dart';
import 'package:test_mu/PageNavigator.dart';

import '../Classes/User.dart';

class Add extends StatefulWidget {
  Add({this.mainUser});

  User mainUser;

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final captionC = TextEditingController();
  final imageDirectoryC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 100, right: 100, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400,
            child: DropdownButton<Community>(
              hint: Text("  Select a community to publish post  ",style: TextStyle(color: Colors.white),),
              items: widget.mainUser.communities.map((Community value) {
                return DropdownMenuItem<Community>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
          Theme(
            data: new ThemeData(
              primaryColor: Colors.white,
              primaryColorDark: Colors.white,
            ),
            child: TextField(
              controller: captionC,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'Tyepe your caption for new post',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white)),
                labelText: 'Caption',
                prefixIcon: Icon(
                  Icons.short_text_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          // ElevatedButton(
          //     onPressed: () async {
          //       FilePickerResult result = await FilePicker.platform.pickFiles();
          //       if (result != null) {
          //         print(result.files.first.name);
          //       }
          //       imageDirectoryC.text = "assets/google.png";
          //     },
          //     child: Text(
          //       "choose image for new post",
          //       style: TextStyle(color: Colors.white),
          //     )),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                widget.mainUser.communities.elementAt(0).posts.add(new Post(
                    caption: captionC.text,
                    // imageDirectory: "assets/google.png",
                    owner: widget.mainUser));
                captionC.clear();
              },
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(30)),
              child: Text("Upload new post",style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}
