import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/function_class/FieldTextMission.dart';
import 'package:flutter_application_1/function_class/MissionDef.dart';
import 'package:flutter_application_1/function_class/TextFiled.dart';
import 'package:flutter_application_1/function_class/buttons.dart';
import 'package:flutter_application_1/models/ObjectiveExplorer.dart';
import 'package:flutter_application_1/services/dbservices.dart';

import '../../data.dart';

class Mission extends StatefulWidget {
  String title;
  String badge;
  String etoile;
  String categorie;
  late var fixedLengthList;


  Mission(this.title, this.badge, this.etoile, this.fixedLengthList,this.categorie);
  @override
  _MissionState createState() => _MissionState();
}

class _MissionState extends State<Mission> {


  @override
  Widget build(BuildContext context) {

    var user = FirebaseAuth.instance.currentUser;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          backgroundColor: Colors.white,
          //centerTitle: true,
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 28, color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  widget.badge,
                  width: 70,
                ),
                Image.asset(
                  widget.etoile,
                  width: 30,
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                child: Text(
                  "The candidate shall have the following requirements to obtain the Bronze Star",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                  textAlign: TextAlign.justify,
                )),
            SizedBox(height: width / 30),
            MissionDefinition(widget.fixedLengthList[0], () {},(){DatabaseService()
                .addFavoriteMission(ObjectiveExplorer(objectiveID: widget.categorie, objectiveUserID: user!.email, mission: missionreplce(widget.title)), user!.uid,widget.title);}),
            MissionDefinition(widget.fixedLengthList[1], () {},(){DatabaseService()
                .addFavoriteMission(ObjectiveExplorer(objectiveID: widget.categorie, objectiveUserID: user!.email, mission: missionreplce(widget.title)), user!.uid,widget.title);}),
            MissionDefinition(widget.fixedLengthList[2], () {},(){DatabaseService()
                .addFavoriteMission(ObjectiveExplorer(objectiveID: widget.categorie, objectiveUserID: user!.email, mission: missionreplce(widget.title)), user!.uid,widget.title);}),
            MissionDefinition(widget.fixedLengthList[3], () {},(){DatabaseService()
                .addFavoriteMission(ObjectiveExplorer(objectiveID: widget.categorie, objectiveUserID: user!.email, mission: missionreplce(widget.title)), user!.uid,widget.title);}),
          ]),
        )));
  }
  Map<dynamic,dynamic> missionreplce(String badget){
    //late Map<dynamic,dynamic> missionbadge={};
    var missionbadge = new Map();
    var badge=['Roaming badge','Observer badge','Eco badge','Paramedic badge','Chef badge','Tracker Badge','vector badge , determine the dimensions and heights','Map Learner Badge and road signs','Signal Addressee Badge', 'Akkad Badge','Screws badge','Camp badge'];

    for (String i in badge) {

      missionbadge['$i'] = {'question 1':
        {
          'commentaire': "$i",
          'date': "",
          'place': "",
          'squad leader': '',
          'supervisor leader': ''
        },'question 2':
        {
          'commentaire': "tgtrg",
          'date': "aaaaaaaa",
          'place': "",
          'squad leader': '',
          'supervisor leader': ''
        },'question 3':
        {
          'commentaire': "",
          'date': "",
          'place': "",
          'squad leader': '',
          'supervisor leader': ''
        },'question 4':
        {
          'commentaire': "",
          'date': "",
          'place': "",
          'squad leader': '',
          'supervisor leader': ''
        }
      };


    }



    return(missionbadge[badget]);

  }


}
