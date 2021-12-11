import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Academy extends StatefulWidget {

  @override
  _AcademyState createState() => _AcademyState();
}

class _AcademyState extends State<Academy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: 830,
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
            child: Stack(children: <Widget>[
              Container(
                height: 270,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(126, 112, 39, 0.8),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(40))),
              ), // Required some widget in between to float AppBar

              Positioned(
                top: 0.0, // To take AppBar Size only
                left: 0.0,

                right: 0.0,
                child: Container(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(40)),
                    child: Image.asset('assets/nat.png'),
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
                  top: 225, // To take AppBar Size only
                  left: 40.0,
                  right: 0.0,
                  child: GestureDetector(
                      onTap: () {
                        print("Container was tapped");
                      },
                      child: Container(
                          child: Text(
                        "Camping Academy",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )))),
              Column(
                children: [
                  SizedBox(
                    height: 280,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 390,
                        child: Text(
                          "It is a pioneering project in the field of informal training It is intended for guides and scouts. Aims to frame Capricorn and future work to produce leaders Highly qualified and experienced leaders with different talents. It also aims to develop the role of the scouting movement inThe field of capacity and skill development. Academy progress for beneficiaries and associates its specialized programs in each camping arts. The administration of the Academy is awarded Badges and certificates of competencies under the supervision of experienced leadersand those in the field.",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(255, 255, 255, 1),
                              Color.fromRGBO(140, 207, 146, 1)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(40),
                              topLeft: Radius.circular(40)),
                        ),
                        width: 380,
                        height: 150,
                        padding: EdgeInsets.only(
                            left: 25, right: 40, top: 20, bottom: 10),
                        child: Expanded(
                          child: new ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              Text(
                                "Leadership is the art of letting someone else do something you want because they want to do it. ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Doueyet Izenhaouer",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.end,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ])),
      ),
    );
  }
}
