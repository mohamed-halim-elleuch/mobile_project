import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_models/teamdef.dart';

import 'academy_definition.dart';

class Membrescouts extends StatefulWidget {

  @override
  _MembrescoutsState createState() => _MembrescoutsState();
}

class _MembrescoutsState extends State<Membrescouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: 2000,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(200, 241, 170, 1)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 270,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(126, 112, 39, 0.8),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(40))),
                  ), // Required some widget in between to float AppBar

                  Positioned(
                    top: -28, // To take AppBar Size only
                    left: 0.0,

                    right: 0.0,
                    child: Container(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(40)),
                        child: Image.asset('assets/team.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    //top: 40.0, // To take AppBar Size only
                    left: -350.0,

                    right: 0.0,
                    child: Container(
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 40,
                          color: Color.fromRGBO(126, 112, 39, 0.8),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170, // To take AppBar Size only
                    left: 100.0,

                    right: 0.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Academy()),
                        );
                      },
                      child: Container(
                          child: Row(children: <Widget>[
                        Text(
                          "Camping",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " Academy",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.brown[800],
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
                    ),
                  ),
                  Positioned(
                      top: 220, // To take AppBar Size only
                      left: 40.0,
                      right: 0.0,
                      child: GestureDetector(
                          onTap: () {
                            print("Container was tapped 2");
                          },
                          child: Container(
                              child: Text(
                            "Team",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )))),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                  child: new ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Teamdef(
                      path: 'assets/c1.png',
                      name: "Mohamed Nabil Ghorbel",
                      post: "Leader of Camping Academy"),
                  Teamdef(
                      path: 'assets/c2.png',
                      name: "Bassem Trigui",
                      post: "Responsible of financial & logistics"),
                  Teamdef(
                      path: 'assets/c3.png',
                      name: "Anis kammoun",
                      post: "Responsible of Media & documentation"),
                  Teamdef(
                      path: 'assets/c4.png',
                      name: "Hiba Feki",
                      post: "Lieutenant Commander of the Academy"),
                  Teamdef(
                      path: 'assets/c5.png',
                      name: "kais kammoun",
                      post: "Configuration and Component Officer"),
                  Teamdef(
                      path: 'assets/c6.png',
                      name: "Slim Hdiji",
                      post: "Project technical advisor"),
                  Teamdef(
                      path: 'assets/c7.png',
                      name: "Hafedh Ben Mabrouk",
                      post: "Responsible of externals relations"),
                  Teamdef(
                      path: 'assets/c8.png',
                      name: "Roua Jarraya",
                      post: "Responsible of girls and communications"),
                  Teamdef(
                      path: 'assets/c9.png',
                      name: "Faiez Medhioub",
                      post: "Responsible of Meetings and camps"),
                  Teamdef(
                      path: 'assets/c10.png',
                      name: "Safa kotti",
                      post: "Management and follow-up"),
                ],
              )),
              SizedBox(height: 5)
            ])));
  }
}
