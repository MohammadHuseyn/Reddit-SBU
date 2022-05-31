import 'package:flutter/material.dart';
class Search extends StatelessWidget {
  final captionC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20,left: 40,right: 40, bottom: 20),
          alignment: Alignment.topLeft,
          color: Colors.black,
          child: Theme(
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
                hintText: 'Type name of a comminuty to search',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white)),
                labelText: 'Comminuty',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Divider(color: Colors.white,height: 2,),
        Container(
          color: Colors.black,
          height: 100,
        )
      ],
    );
  }
}
