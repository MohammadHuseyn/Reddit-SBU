import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/Authentication/Login.dart';

import '../PageNavigator.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key key}) : super(key: key);

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  @override
  bool rememberMe = false;
  bool unvisibility = true;

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

  Widget _Mailbox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.email, color: Colors.blueGrey),
              hintText: 'Enter your Email',
            ),
          ),
        ),
      ],
    );
  }
  Widget _UserBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
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

  Widget _SignUpBox() {
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
         onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BottomSwitcher())),
        child: Text(
          'SignUp',
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
          'or try with',
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
                image: AssetImage('assets/facebook.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget Haveaccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Already created an account?',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage()));
          },
          child: Text(
            'Sign in',
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
                    'Create an account',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Ooohbaby",
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  _Mailbox(),
                  _UserBox(),
                  _Passwordbox(),
                  Container(
                      child: Row(
                    children: [
                      _rememberMeBox(),
                    ],
                  )),
                  _SignUpBox(),
                  Haveaccount(),
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
