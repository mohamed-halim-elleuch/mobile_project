import 'package:flutter/material.dart';

Widget Teamdef(
    {required String path,  required String name, required String post}) {
  return ListTile(
      dense: true,
      minLeadingWidth: 30,
      leading: ClipOval(
        child: Image.asset(
          path,
          // width: 55, height: 100
        ),
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      subtitle: Text(post,
          style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(126, 112, 68, 1),
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.left));
}
