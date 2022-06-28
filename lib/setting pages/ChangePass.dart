import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/PageNavigator.dart';
import 'package:test_mu/main.dart';

class ChangePass extends StatefulWidget {
  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  var lastC = new TextEditingController();
  var newC = new TextEditingController();
  var confirmC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Change passwrod"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
            child: TextField(
              controller: lastC,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'Enter old password',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white)),
                labelText: 'Old Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
            child: TextField(
              controller: newC,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'Enter new password',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white)),
                labelText: 'New Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
            child: TextField(
              controller: confirmC,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'Confirm you password',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white)),
                labelText: 'Confirm',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(onPressed: () {
              if (lastC.text == "" || newC.text == "" || confirmC.text == ""){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("fields can't be empty"),
                ));
              }else if (lastC.text != mainUser.password) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("last password doesn't match"),
                ));
              }else if (newC.text != confirmC.text){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("new pass and confirm pass doesn't match"),
                ));
              }else {
                mainUser.password = newC.text;
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Password changed successfully"),
                ));
              }
            }, child: Text("Chane password",style: TextStyle(color: Colors.white,fontSize: 25),),
              style: ElevatedButton.styleFrom(padding: EdgeInsets.only(top: 30, left: 50, right: 50,bottom: 30)),
            ),
          ),
        ],
      ),
    );
  }
}
