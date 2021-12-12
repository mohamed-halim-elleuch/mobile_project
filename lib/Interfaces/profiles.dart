import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Profile.dart';

class Profiles extends StatefulWidget {
  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  late String place=' Place';
  late String birthday ='Birthday';
  late String telparent ='Home Tel';
  late String tel ='Personal Tel';
  late String adress ='Adress';
  late String Dateofscoot ='Date of scoot Movement';
  late String region ='Region';
  late String group ='Group';
  late String squad ='Squad';
  late String vanguard ='Vanguard';
  late String The_current_scouting_plan_of_the_squad ='The current scouting plan of the squad ';
  late String Date_of_joining_the_camping_academy ='Date of joining the camping academy';
  late String image;
  _fetch() async {
    final user =  FirebaseAuth.instance.currentUser;
    final id = user!.uid;
    if (user!=null){
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(id)
          .get()
          .then((value){
        place = value.data()!['place'];
        birthday  = value.data()!['birthday'];
        telparent = value.data()!['Telparent'];
        tel = value.data()!['tel'];
        adress = value.data()!['adress'];
        Dateofscoot = value.data()!['Dateofscoot'];
        region = value.data()!['region'];
        group = value.data()!['group'];
        squad = value.data()!['squad'];
        vanguard = value.data()!['vanguard'];
        The_current_scouting_plan_of_the_squad = value.data()!['plan'];
        Date_of_joining_the_camping_academy  = value.data()!['dateofjoining'];
        image=value.data()!['image'];

      }).catchError((e){
        print(e);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _fetch(),
          builder: (context, snapshot){
            if (snapshot.connectionState != ConnectionState.done){
              return Center(child:CircularProgressIndicator(color: Colors.black));
            }else{
              return Profile(places:place, Date_of_joining_the_camping_academy: Date_of_joining_the_camping_academy, group: group, The_current_scouting_plan_of_the_squad: The_current_scouting_plan_of_the_squad,
                region: region, Dateofscoot: Dateofscoot, squad: squad, tel: tel, birthday: birthday, telparent: telparent, adress: adress, vanguard: vanguard,


              );
            }
          }
      ),
    );
  }
}