import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/ObjectiveExplorer.dart';
import 'package:flutter_application_1/services/dbservices.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'FieldTextMission.dart';
import 'TextFiled.dart';
import 'buttons.dart';
import 'file.dart';

class MissionDefinition extends StatefulWidget {
  Function checkbox;
  var button;
  final String question;
  var idd;


  MissionDefinition(this.question,this.checkbox,this.button,this.idd);

  @override
  _MissionDefinitionState createState() => _MissionDefinitionState();

}

class _MissionDefinitionState extends State<MissionDefinition> {
  TextEditingController squad_leader = TextEditingController();
  TextEditingController supervisor = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController commentaire = TextEditingController();

  Future<void> loadData(idd) async {
    var user = FirebaseAuth.instance.currentUser;
    var docSnapshot = await FirebaseFirestore.instance
    .collection('objective1')
        .doc('Explorer').
    collection('Roaming badge').
    doc(user!.uid).
    get();
    var data = docSnapshot.data();
    setState(() {

      //print(data.values.map((e) => print(e)));
      /*var List = data;

      try{
        switch(idd){
          case 1:{
            squad_leader.text = List['question 1'] ['squad leader'];
            place.text = List[1]['place'];
            date.text = List[1]['date'];
            supervisor.text = List[1]['supervisor leader'];
            commentaire.text = List[1]['commentaire'];
          }break;
          case 2:{
            squad_leader.text = List[2]['squad leader'];
            place.text = List[2]['place'];
            date.text = List[2]['date'];
            supervisor.text = List[2]['supervisor leader'];
            commentaire.text = List[2]['commentaire'];
          }break;
          case 3:{
            squad_leader.text = List[3]['squad leader'];
            place.text = List[3]['place'];
            date.text = List[3]['date'];
            supervisor.text = List[3]['supervisor leader'];
            commentaire.text = List[3]['commentaire'];
          }break;
          case 4:{
            squad_leader.text = List[4]['squad leader'];
            place.text = List[4]['place'];
            date.text = List[4]['date'];
            supervisor.text = List[4]['supervisor leader'];
            commentaire.text = List[4]['commentaire'];
          }break;

        }*/

      /*for(var i in data!.keys){
        try{
          switch(idd) {
            case 1:
              {
                squad_leader.text = List['question 1'] ['squad leader'];
                place.text = List[1]['place'];
                date.text = List[1]['date'];
                supervisor.text = List[1]['supervisor leader'];
                commentaire.text = List[1]['commentaire'];
              }
              break;
            case 2:
              {
                squad_leader.text = List[2]['squad leader'];
                place.text = List[2]['place'];
                date.text = List[2]['date'];
                supervisor.text = List[2]['supervisor leader'];
                commentaire.text = List[2]['commentaire'];
              }
              break;
            case 3:
              {
                squad_leader.text = List[3]['squad leader'];
                place.text = List[3]['place'];
                date.text = List[3]['date'];
                supervisor.text = List[3]['supervisor leader'];
                commentaire.text = List[3]['commentaire'];
              }
              break;
            case 4:
              {
                squad_leader.text = List[4]['squad leader'];
                place.text = List[4]['place'];
                date.text = List[4]['date'];
                supervisor.text = List[4]['supervisor leader'];
                commentaire.text = List[4]['commentaire'];
              }
              break;
          }
          }catch(e){print(e);}
      }*/
      //
      //birthday.text.trim() = document.data().toString()['birthday']
    });
  }

  /*Future<void> singlebadge(String objectiveID) async {
    CollectionReference _objective1 = FirebaseFirestore.instance.collection('objective1');
    final doc = await _objective1.doc(objectiveID).get();
    var question1;
    //objectiveID: objectiveID,
    objectiveUserID: doc.get('objectiveUserID');
    question1= doc.get('question 1');
    question2: doc.get('question 2');
    question3: doc.get('question 3');
    question4: doc.get('question 4');

    return;
  }*/


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     print('categorie: '+widget.idd.toString());
     loadData(widget.idd);
    //place.text = data;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    /*void OpenFiles(List<PlatformFile> files) =>
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FilePage (
          files: files,
          onOpenedFile:openFile,
        )));*/
    return Column(
      children: [
        Container(
          width: width - 100 / 2,
          height: width * 1.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.0)), //
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: width / 30),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () async {
                      final result = await FilePicker.platform
                          .pickFiles(allowMultiple: true);
                      if (result == null) return;
                      //OpenFiles(result.files);
                      final file = result.files.first;
                      openFile(file);
                      print('Name: ${file.name}');
                      print('Bytes: ${file.bytes}');
                      print('Size: ${file.size}');
                      print('Extension: ${file.extension}');
                      print('Path: ${file.path}');
                      // final newFile = await saveFilePermently(file);
                      print('From Path: ${file.path}');
                      // print('To Path: ${newFile.path}');
                    },
                    icon: Icon(Icons.download_rounded),
                    iconSize: 30,
                  ),
                  // SizedBox(width:width/30),
                  Container(
                    width: width - 300 / 2,
                    child: Text(
                      widget.question,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ), //Text
                  Checkbox(
                    value: true,
                    onChanged: (bool? value) {
                      widget.checkbox;
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: width / 30),
                  TextFieldMission(
                    name: "Squad leader",
                    size: width / 2.7,
                    line: 1,
                    controller: squad_leader,
                  ),
                  SizedBox(width: width / 16),
                  TextFieldMission(
                    name: "Supervisor leader",
                    size: width / 2.7,
                    line: 1,
                    controller: supervisor,
                  ),
                  SizedBox(width: width / 30),
                ],
              ),
              SizedBox(height: width / 30),
              Row(
                children: [
                  SizedBox(width: width / 30),
                  TextFieldMission(
                    name: "Date",
                    size: width / 2.7,
                    line: 1,
                    controller: date,
                  ),
                  SizedBox(width: width / 16),
                  TextFieldMission(
                    name: "Place",
                    size: width / 2.7,
                    line: 1,
                    controller: place,
                  ),
                  SizedBox(width: width / 30),
                ],
              ),
              SizedBox(height: width / 30),
              TextFieldMission(
                name: "Commentaire ....",
                size: width / 1.25,
                line: 3,
                controller: commentaire,
              ),

              SizedBox(height: width / 15),
              button(
                  val: "Submit",
                  onTap: () {
                    setState(() {
                      widget.button(date,place,supervisor,squad_leader);
                      print(date);
                    });
                  }),
            ],
          ),
        ),
        SizedBox(height: width / 30),
      ],
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
/*
  saveFilePermently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile ('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFile.path);*/
}


