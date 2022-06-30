import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/PageNavigator.dart';
import 'package:test_mu/main.dart';

class ChangeUserInfo extends StatefulWidget {
  @override
  State<ChangeUserInfo> createState() => _ChangeUserInfoState();
}

class _ChangeUserInfoState extends State<ChangeUserInfo> {
  var firstNameC = new TextEditingController();
  var lastNameC = new TextEditingController();
  var emailC = new TextEditingController();
  var usernameC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    firstNameC.text = mainUser.firstName;
    lastNameC.text = mainUser.lastName;
    emailC.text = mainUser.email;
    usernameC.text = mainUser.username;
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
              controller: firstNameC,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'Enter your firstname',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white)),
                labelText: 'firstname',
                prefixIcon: Icon(
                  Icons.short_text_rounded,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
            child: TextField(
              controller: lastNameC,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'Enter your lastname',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white)),
                labelText: 'lastname',
                prefixIcon: Icon(
                  Icons.short_text_rounded,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
            child: TextField(
              controller: emailC,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white)),
                labelText: 'email',
                prefixIcon: Icon(
                  Icons.short_text_rounded,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
            child: TextField(
              readOnly: true,
              controller: usernameC,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: 'Uneditable',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white)),
                labelText: 'username',
                prefixIcon: Icon(
                  Icons.short_text_rounded,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () {
                if (firstNameC.text == "" ||
                    lastNameC.text == "" ||
                    emailC.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("fields can't be empty"),
                  ));
                }else {
                  mainUser.firstName = firstNameC.text;
                  mainUser.lastName = lastNameC.text;
                  mainUser.email = emailC.text;
                  Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("User info updated"),
                ));
                }
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: Text("Password changed successfully"),
                // ));
              },
              child: Text(
                "Update Info",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(
                      top: 30, left: 50, right: 50, bottom: 30)),
            ),
          ),
        ],
      ),
    );
  }
}
