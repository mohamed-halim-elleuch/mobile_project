import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/testsouvenirs.dart';
import 'package:flutter_application_1/view_models/buttons.dart';
import 'package:flutter_application_1/view_models/eventtextfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import'dart:io';

class Souvenirs extends StatefulWidget {
  const Souvenirs({Key? key}) : super(key: key);

  @override
  _SouvenirsState createState() => _SouvenirsState();
}

class _SouvenirsState extends State<Souvenirs> {
  late UserCredential userCredential;
  TextEditingController title = TextEditingController();
  TextEditingController Date = TextEditingController();
  TextEditingController image = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  bool loading = false;
  late File images = File('');
  late String imgUrl;

  sendData() async {
    bool hasException = false;
    try {
      var storageimage = FirebaseStorage.instance.ref().child(images.path);
      var task = await storageimage.putFile(images);
      imgUrl = await (await task).ref.getDownloadURL();
      await FirebaseFirestore.instance.collection('Souvenirs').add({
        'title': title.text.trim(),
        'Date': Date.text.trim(),
        'image': imgUrl,

      });
    } catch (e) {
      hasException = true;
    } finally {
      if (!hasException) {
        setState(() {
          loading = false;
        });

        Navigator.pop(context);
      } else {
        setState(() {
          loading = false;
        });
      }
    }
  }

  void validation() {
    if (title.text
        .trim()
        .isEmpty || title.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter The Title!',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    if (Date.text
        .trim()
        .isEmpty || Date.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please enter the date',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));

      return;
    } else {
      setState(() {
        loading = true;
        Text("Please few seconds");
      });
      sendData();
    }
  }

  _imgFromCamera() async {
    var img = await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      images = File(img!.path);

    });
  }

  _imgFromGallery() async {
    var img = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      images = File(img!.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final height = size.height;
    final width = size.width;
    final user = FirebaseAuth.instance.currentUser;
    final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('Souvenirs');


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
            children: [ ListTile(
              tileColor: Colors.white70,
              //toolbarHeight: 50,
              //elevation: 3.0,
              leading: Icon(Icons.wallet_membership_outlined,
                  color: Colors.indigo[900], size: 30),
              title: Text('Souvenirs',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.indigo[900],
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  )),
              trailing: Padding(
                padding: const EdgeInsets.all(5.0),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.indigo[800],
                  ),
                ),
              ),
            )
              , Expanded(
                child: StreamBuilder(
                    stream: collectionReference.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          children: snapshot.data!.docs.map((e) =>
                              Testsouvenir(
                                title: e['title'],
                                date: e['Date'],
                                image: e['image'],
                              )
                          ).toList(),

                        );
                      }
                      return Center(child: CircularProgressIndicator(),);
                    }

                ),
              ),
            ]
        ),

      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                SimpleDialog(
                  title: Row(
                    children: [
                      const Text('Add Souvenirs '),
                      SizedBox(width: width / 4.2,),
                      Column(
                        children: [
                          IconButton(onPressed: (){
                            setState(() {
                              _showPicker(context);

                            });


                          },

                            icon: Icon(Icons.upload),
                            iconSize: 30,
                            color: Colors.black),

                        ],
                      ),
                    ],
                  ),

                  children: <Widget>[
                    ListTile(
                        title: EventTextField(name: 'Title',
                            icon: Icons.card_membership_outlined,
                            controller: title,
                            size: 1)
                    ),
                    ListTile(
                        title: EventTextField(name: 'Date : Month,Day Year',
                          icon: Icons.date_range,
                          controller: Date,
                          size: 1,)
                    ),
                    SizedBox(height: 20),
                    loading
                        ? CircularProgressIndicator(color: Colors.black)
                        : button(
                        val: "Submit",
                        onTap: () async {
                          validation();
                        }),
                  ],
                ),
          );
        },
        icon: Icon(Icons.add),
        label: Text('ADD'),
      ),
    );
  }
}
