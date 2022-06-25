import 'dart:async';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/Authentication/Signup.dart';
import '../PageNavigator.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({Key key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool rememberMe = false;
  bool unvisibility = true;
  TextEditingController userName;
  TextEditingController passWord;
  TextEditingController mail;
  Socket socket;
  bool login = false;
  void changestateunvisibility() {
    setState(() {
      unvisibility = !unvisibility;
    });
  }

  Widget _Passwordbox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            controller: passWord,
            obscureText: unvisibility,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.lock, color: Colors.blueGrey),
              suffixIcon: TextButton(
                child: Icon(
                  Icons.visibility,
                  color: Colors.blueGrey,
                ),
                onPressed: changestateunvisibility,
              ),
              hintText: 'Enter your Password',
            ),
          ),
        ),
      ],
    );
  }

  Widget _MailBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            controller: mail,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.email, color: Colors.blueGrey),
              hintText: 'Enter your Mail',
            ),
          ),
        ),
      ],
    );
  }
  Widget _Userbox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            controller: userName,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.email, color: Colors.blueGrey),
              hintText: 'Enter your Username',
            ),
          ),
        ),
      ],
    );
  }

  Widget _ForgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Not available right now"),
        )),
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }

  Widget _rememberMeBox() {
    return Container(
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.green),
            child: Checkbox(
              value: rememberMe,
              shape: CircleBorder(),
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  rememberMe = value;
                });
              },
            ),
          ),
          Text('Remember me'),
        ],
      ),
    );
  }
Future<String> _sendMassage() {
    // socket = await Socket.connect('localhost', 16);
    // print("connected");
    // socket.write("l-"+userName.text+"-"+passWord.text+"-"+mail.text);
    // socket.flush();
    // return "true";
}
  Widget _LoginBox() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          padding: EdgeInsets.only(
            bottom: 20.0,
            top: 20.0,
          ),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () async{
          Socket client = await Socket.connect('172.20.173.31', 16);
          print("connected");
          client.write("test\n");
          client.flush();
          print("send");
          // if(b==true) {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => BottomSwitcher()));
          //   sleep(Duration(milliseconds: 1000));
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //     content: Text("You are loged in now"),
          //   ));
          // }else{print("sonthimg is wrong");}
        },
          child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ooohbaby',
          ),
        ),
      ),
    );
  }

  Widget _Signinwith() {
    return Column(
      children: <Widget>[
        Text(
          'or try log in with',
          style: TextStyle(
            color: Colors.black38,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _more() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Not available right now"),
          )),
          child: Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/google.png'),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Not available right now"),
          )),
          child: Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/github.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget Donthaveaccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Don’t have an account?',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Signuppage()));
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if(login){
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BottomSwitcher(),
      );
    }else return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green,
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Ooohbaby",
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  _Userbox(),
                  _Passwordbox(),
                  _MailBox(),
                  Container(
                      child: Row(
                    children: [
                      _ForgotPassword(),
                      _rememberMeBox(),
                    ],
                  )),
                  _LoginBox(),
                  Donthaveaccount(),
                  SizedBox(
                    height: 15.0,
                  ),
                  _Signinwith(),
                  SizedBox(
                    height: 30.0,
                  ),
                  _more(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
