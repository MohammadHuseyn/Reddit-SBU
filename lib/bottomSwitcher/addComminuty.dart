import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/Classes/Community.dart';
import 'package:test_mu/PageNavigator.dart';
import 'addPost.dart';
import '../Classes/User.dart';

class AddComminuty extends StatefulWidget {
  AddComminuty({this.mainUser});

  User mainUser;

  @override
  State<AddComminuty> createState() => _AddComminutyState();
}

class _AddComminutyState extends State<AddComminuty> {
  final captionC = TextEditingController();
  final nameC = TextEditingController();
  void addCom(Community community){
    setState((){
      community.followers.add(mainUser);
      community.admins.add(mainUser);
      mainUser.communities.add(community);
    });
  }
  @override
  Widget build(BuildContext context) {
    captionC.text = "";
    nameC.text = "";
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
              // Container(
              //   width: 400,
              //   child: DropdownButton<Community>(
              //     hint: Text("  Select a community to publish post  ",style: TextStyle(color: Colors.white),),
              //     items: widget.mainUser.communities.map((Community value) {
              //       return DropdownMenuItem<Community>(
              //         value: value,
              //         child: Text(value.name),
              //       );
              //     }).toList(),
              //     onChanged: (_) {},
              //   ),
              // ),
              Theme(
                data: new ThemeData(
                  primaryColor: Colors.white,
                  primaryColorDark: Colors.white,
                ),
                child: TextField(
                  controller: nameC,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: 'Type commminuty name',
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white)),
                    labelText: 'Name',
                    prefixIcon: Icon(
                      Icons.short_text_rounded,
                      color: Colors.white,
                    ),
                  ),
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
                    hintText: 'Type your caption for new comminuty',
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
                    if(captionC.text == "" || nameC.text == ""){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("caption or name can not be empty"),
                      ));
                    }else{
                      Community comminuty = new Community(owner: mainUser,descriptoin: captionC.text,name: nameC.text);
                      addCom(comminuty);
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(30)),
                  child: Text("Make new Comminuty",style: TextStyle(fontSize: 20),)),
            ],
          ),
        ),
      ),
    );
  }
}
