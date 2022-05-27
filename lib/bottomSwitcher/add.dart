import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Post.dart';
import 'package:test_mu/PageNavigator.dart';

import '../Classes/User.dart';

class Add extends StatelessWidget {
  Add({this.mainUser});

  User mainUser;
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
          SizedBox(height: 50,),
          ElevatedButton(
              onPressed: () async {
                FilePickerResult result = await FilePicker.platform.pickFiles();
                if (result != null) {
                  print(result.files.first.name);
                }
                imageDirectoryC.text = "assets/google.png";
              },
              child: Text("choose image for new post",
                style: TextStyle(color: Colors.white),)
          ),
          SizedBox(height: 50,),
          ElevatedButton(
              onPressed: () {
                mainUser.posts.add(new Post(caption: captionC.text,
                    imageDirectory: "assets/google.png", owner: mainUser));
                captionC.clear();
              },
              child: Text("Upload new post"))
        ],
      ),
    );
  }
}

