import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import 'package:flutter_application_1/chat/message.dart';
import 'package:flutter_application_1/chat/new_message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  void initState(){
    super.initState();
    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(onMessage: (msg){
      print(msg);
      return;
    },
      onLaunch: (msg){
        print(msg);
        return ;
      },
      onResume: (msg){
        print(msg);
        return;
      },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: Text('Friends Chat',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
        centerTitle: true,
      ),
      body:Container(
        child:  Column(
          children: [
            Expanded(
                child: Messages()),
            NewMessages()
          ],
        ),
      ),
    );
  }
}