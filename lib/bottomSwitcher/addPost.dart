import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Community.dart';
import 'package:test_mu/Classes/Post.dart';
import 'package:test_mu/PageNavigator.dart';

import '../Classes/User.dart';

class AddPost extends StatefulWidget {
  AddPost({this.mainUser});

  User mainUser;

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final captionC = TextEditingController();
  final imageDirectoryC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Community selectedComminuty = null;
    captionC.text = "";
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new post"),
        backgroundColor: Colors.black54,
      ),
      body: Container(
        color: Colors.black87,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 100, right: 100, top: 50),
        child: Center(
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
                    selectedComminuty = value;
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
              SizedBox(height:20,),
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
              // SizedBox(
              //   height: 50,
              // ),
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
                    if(captionC.text == "" || selectedComminuty == null){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Fields can not be empty"),
                      ));
                    }else if (!selectedComminuty.admins.contains(mainUser)){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("you are not admin in this comminuty"),
                      ));
                    }else {
                        Post post = new Post(owner: mainUser, caption: captionC.text,community: selectedComminuty);
                        setState((){
                          selectedComminuty.posts.add(post);
                        });
                        Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(30)),
                  child: Text("Upload new post",style: TextStyle(fontSize: 20),)),

            ],
          ),
        ),
      ),
    );
  }
}
