import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_models/buttons.dart';

class Choose extends StatefulWidget {
  const Choose({Key? key}) : super(key: key);
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              //top: 50, // To take AppBar Size only
              left: -350.0,
              right: 0.0,
              child: IconButton(
                icon: Icon(Icons.arrow_back_sharp),
                onPressed: () {
                  Navigator.pop(context);
                },
                iconSize: 40,
              )),
          Positioned(
            top: 100, // To take AppBar Size only
            left: 0.0,
            right: 0.0,
            child: Image.asset('assets/logo.png'),
          ),
          Positioned(
              top: 300, // To take AppBar Size only
              left: 80.0,
              right: 0.0,
              child: Text(
                "Are you a member of scouts",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          Positioned(
              top: 330, // To take AppBar Size only
              left: 125.0,
              right: 0.0,
              child: Text(
                "or administration?",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          Positioned(
              top: 380, // To take AppBar Size only
              left: 0.0,
              right: 0.0,
              child: button(
                  val: "Scout member",
                  onTap: () {
                    Navigator.pushNamed(context, '/signup_member');
                  })),
          Positioned(
              top: 450, // To take AppBar Size only
              left: 0.0,
              right: 0.0,
              child: button(
                  val: "Admin",
                  onTap: () {
                    Navigator.pushNamed(context, '/signup_admin');
                  })),
        ],
      ),
    );
  }
}
