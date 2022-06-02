import 'package:flutter/material.dart';
import 'package:test_mu/Authentication/Login.dart';
import 'package:test_mu/Authentication/Signup.dart';
import 'PageNavigator.dart';
void main() {
  runApp(MyApp());
}

// void a(){
//   Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//       builder: (BuildContext context){
//     return BottomSwitcher();
//   }),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Loginpage(),
    );
  }
}
