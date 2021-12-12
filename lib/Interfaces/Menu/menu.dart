import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Interfaces/FirstInterface.dart';
import 'package:flutter_application_1/Interfaces/Menu/membre_scout.dart';
import 'package:flutter_application_1/Interfaces/eventour.dart';
import 'package:flutter_application_1/Interfaces/souvenirs.dart';
import 'package:flutter_application_1/function_class/Weather.dart';
import 'package:flutter_application_1/function_class/advantages.dart';
import 'package:flutter_application_1/function_class/gest_detector.dart';
import 'package:flutter_application_1/function_class/googlesignin.dart';
import 'package:flutter_application_1/function_class/navigation%20bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../APImaps.dart';
import '../signIn.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    final width= MediaQuery.of(context).size.width;
    final height= MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 232, 232, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height/15,
            ),
            Row(
              children: [
                SizedBox(
                  width: width/8,
                ),
                Text("Menu",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600])),
              ],
            ),
            SizedBox(
              height: height/20,
            ),
            Row(
              children: [
                SizedBox(
                  width: width/12,
                ),
                ClipOval(
                  child: Image.asset(
                    'assets/c5.png',
                    width: 60,
                  ),
                ),
                /*CircleAvatar(
                    backgroundImage:NetworkImage(
                    user!.photoURL!,
                  ),
                ),*/
                SizedBox(
                  width: width/25,
                ),
                Container(
                  width:width/1.4,
                  child: Text(
                    user!.email!,

                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 1.0,
                width: 800.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: height/50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Column(
                  children: [
                    Gest_detector(
                        "Events",
                        () => showModalBottomSheet(
                              //expand: false,
                              context: context,
                              backgroundColor: Colors.white,
                              builder: (context) => EventOur(),
                            )),
                    SizedBox(
                      height: height/70,
                    ),
                    Gest_detector(
                        "Advantages",
                        () => showModalBottomSheet(
                              //expand: false,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Advantages(),
                            )),
                    SizedBox(
                      height: height/70,
                    ),
                    Gest_detector(
                        "Weather",
                        () => showModalBottomSheet(
                              //expand: false,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Weather(),
                            )),
                  ],
                ),
                SizedBox(
                  width: width/30,
                ),
                Column(
                  children: [
                    Gest_detector("Location", () {
                      Navigator.pushNamed(context, '/location');

                    }),
                    SizedBox(
                      height: 10,
                    ),
                    Gest_detector("Team", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Membrescouts()),
                      );
                    }),
                    SizedBox(
                      height: height/70,
                    ),
                    Gest_detector(
                        "Souvenirs",
                        () => showModalBottomSheet(
                              //expand: false,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Souvenirs(),
                            )),
                  ],
                )
              ],
            ),
            SizedBox(
              height: height/35,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 1.0,
                width: 800.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: height/70,
            ),
            GestureDetector(
                onTap: () {
                  print("Container was tapped");
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.logout),
                        hoverColor: Colors.black26,
                        iconSize: 35,
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                          provider.logout();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => FirstInterface()));
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => FirstInterface()));
                          final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                          provider.logout();
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: height/70,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 1.0,
                width: 800.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: height/70,
            ),
          ],
        ),
      ),
    );
  }
}
