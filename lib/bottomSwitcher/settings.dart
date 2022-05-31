import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
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
                  ListTile(
                    leading: Icon(
                      Icons.language,
                      color: Colors.red,
                    ),
                    title: Text("Change Language"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
