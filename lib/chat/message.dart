import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import 'messag_buble.dart';

class Messages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt',descending: false).snapshots() ,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final user = FirebaseAuth.instance.currentUser;
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return MessageBubble(
              snapshot.data!.docs[index]['text'],
              snapshot.data!.docs[index]['fullName'],
              snapshot.data!.docs[index]['userId'] == user!.uid,
              //snapshot.data!.docs[index]['image'],

            );

          },
        );
      },
    );


  }
}

