
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'FieldTextMission.dart';
import 'buttons.dart';
import 'file.dart';

class MissionDefinition extends StatefulWidget {

  Function checkbox;
  final String question;

  Function button;
  MissionDefinition(this.question,this.checkbox,this.button);
  @override
  _MissionDefinitionState createState() => _MissionDefinitionState();
}
class _MissionDefinitionState extends State<MissionDefinition> {
  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    /*void OpenFiles(List<PlatformFile> files) =>
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FilePage (
          files: files,
          onOpenedFile:openFile,
        )));*/
    return
          Column(
            children: [
              Container(
                width: width - 100 / 2,
                height: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)), //
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height:width/30),
                    Row(
                      children: <Widget>[
                        IconButton(onPressed: () async {
                          final result = await FilePicker.platform.pickFiles(allowMultiple: true);
                          if (result == null) return;
                          //OpenFiles(result.files);
                          final file =result.files.first;
                          openFile(file);
                          print('Name: ${file.name}');
                          print('Bytes: ${file.bytes}');
                          print('Size: ${file.size}');
                          print('Extension: ${file.extension}');
                          print('Path: ${file.path}');
                         // final newFile = await saveFilePermently(file);
                          print('From Path: ${file.path}');
                         // print('To Path: ${newFile.path}');

                        }, icon: Icon(Icons.download_rounded),iconSize: 30,),
                        // SizedBox(width:width/30),
                        Container(
                          width: width - 300/ 2,
                          child: Text(

                            widget.question,
                            style: TextStyle(fontSize: 15.0,),
                            textAlign:TextAlign.justify,
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
                        SizedBox(width:width/30),
                        TextFieldMission(name: "Squad leader", size: width/2.7,line: 1,),
                        SizedBox(width:width/16),
                        TextFieldMission(name: "Supervisor leader", size: width/2.7,line: 1,),
                        SizedBox(width:width/30),
                      ],
                    ),
                    SizedBox(height:width/30),
                    Row(
                      children: [
                        SizedBox(width:width/30),
                        TextFieldMission(name: "Date", size: width/2.7,line: 1,),
                        SizedBox(width:width/16),
                        TextFieldMission(name: "Place", size: width/2.7,line: 1,),
                        SizedBox(width:width/30),
                      ],
                    ),
                    SizedBox(height:width/30),
                    TextFieldMission(name: "Commentaire ....", size:width/1.25,line: 3,),
                    SizedBox(height:width/15),
                    button(val: "Submit", onTap: (){
                      setState(() {
                        widget.button;
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


