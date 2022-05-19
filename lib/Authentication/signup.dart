import 'dart:html';

import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key key}) : super(key: key);

  @override
  State<Signuppage> createState() => _SignuppageState();
}




class _SignuppageState extends State<Signuppage> {
  bool rememberMe = false;
  Widget _Passwordbox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.lock, color: Colors.blue),
              hintText: 'Enter your Password',
            ),
          ),
        ),
      ],
    );
  }

  Widget _Mailbox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.email, color: Colors.blue),
              hintText: 'Enter your Email',
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
  Widget _ForgotPassword(){
    return  Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forget Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text('Forgot Password?'),
      ),
    );
  }
  Widget _rememberMeBox(){
    return Container(
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: rememberMe,
              checkColor: Colors.indigo,
              activeColor: Colors.white,
              onChanged: (value){
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
  Widget _LoginBox(){
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.blue,
            letterSpacing: 1.5,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ooohbaby',
          ),
        ),
      ),
    );
  }
  Widget _Signinwith(){
    return  Column(
      children: <Widget>[
        Text(
          '--- Or ---',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0,),
        Text(
          'Sign in with',
        ),

      ],
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Colors.black54,
                  Colors.black38,
                  Colors.black54,
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
                  _Mailbox(),
                  _Passwordbox(),
                  _ForgotPassword(),
                  _rememberMeBox(),
                  _LoginBox(),
                  _Signinwith(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
