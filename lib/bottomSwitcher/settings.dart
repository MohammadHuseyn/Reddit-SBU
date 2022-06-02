import 'package:flutter/material.dart';
import 'package:test_mu/Authentication/Login.dart';
import 'package:test_mu/Authentication/Signup.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.red,
                  child: ListTile(
                    onTap: () {},
                    title: Text(
                      "username",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/google.png'),
                    ),
                    trailing: Icon(Icons.edit,color: Colors.white,),
                  ),
                ),
                const SizedBox(height: 10.0,),
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.lock_outline,
                          color: Colors.red,
                        ),
                        title: Text("Change Password"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
                      ),
                      Container(
                        width: double.infinity,
                        height: 2.0,
                        color: Colors.grey.shade300,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.language,
                          color: Colors.red,
                        ),
                        title: Text("Change Language"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
                      ),
                      Container(
                        width: double.infinity,
                        height: 2.0,
                        color: Colors.grey.shade300,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.location_on_rounded,
                          color: Colors.red,
                        ),
                        title: Text("Change Location"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
                      ),
                      Container(
                        width: double.infinity,
                        height: 2.0,
                        color: Colors.grey.shade300,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.build,
                          color: Colors.red,
                        ),
                        title: Text("Build Cmmunity"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
                      ),
                      Container(
                        width: double.infinity,
                        height: 2.0,
                        color: Colors.grey.shade300,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.save_alt,
                          color: Colors.red,
                        ),
                        title: Text("Saved Posts"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Container(
                        // padding: EdgeInsets.only(left: 40,right: 40),
                        // margin: EdgeInsets.only(left: 150,right: 150),
                        color: Colors.red,
                        child: ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          title: Text("Log Out"),
                          trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage()));
                          },
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 150,right: 150),
                        color: Colors.green,
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          title: Text("Sign up a new page"),
                          trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage()));
                          },
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 150,right: 150),
                        color: Colors.blueGrey,
                        child: ListTile(
                          leading: Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                          title: Text("try login in another accout"),
                          trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Signuppage()));
                          },
                        ),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),

                  elevation: 4.0,

                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
