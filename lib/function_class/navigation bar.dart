import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/APImaps.dart';
import 'package:flutter_application_1/Interfaces/Menu/academy_definition.dart';
import 'package:flutter_application_1/Interfaces/Menu/membre_scout.dart';
import 'package:flutter_application_1/Interfaces/Menu/menu.dart';
import 'package:flutter_application_1/Interfaces/Profile.dart';
import 'package:flutter_application_1/Interfaces/friends.dart';
import 'package:flutter_application_1/Interfaces/objectives/objectives.dart';
import 'package:flutter_application_1/Interfaces/profiles.dart';
import 'package:flutter_application_1/Interfaces/setting.dart';
import 'package:image_picker/image_picker.dart';

class Navigationbar extends StatefulWidget {
  Navigationbar({Key ?key}) : super(key: key);

  @override
  _NavigationbarState createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  int selectedPage = 2;
  final _pageOptions = [
    Menu(),
    Settings(),
    Profiles(),
    Friends(),
    Objective(),
    MapSample(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        color: Colors.black,
        backgroundColor: Colors.white,
        activeColor: Colors.blue,
        //cornerRadius: 30,
        items: [
          TabItem(icon: Icons.menu, title: 'Menu'),
          TabItem(icon: Icons.settings, title: 'Settings'),
          TabItem(icon: Icons.supervised_user_circle, title: 'User'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.check, title: 'Objectives'),
          TabItem(icon: Icons.map, title: 'MAP'),
        ],
        initialActiveIndex: selectedPage, //optional, default as 0
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
