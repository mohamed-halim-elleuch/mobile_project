/*import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Text("friends")
    );
  }
}*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Friends"),
    );
  }
}

/*
class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final CollectionReference collectionReference = FirebaseFirestore.instance.collection('userData');




    return Center(
      child:Expanded(
          child: StreamBuilder(stream: collectionReference.snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.hasData){
                return ListView(
                  children: snapshot.data!.docs.map((e) => Column(
                    children: [
                      ListTile(title: Text(e['FullName']+ "     " + e['email'] + "     "+e['password']),),
                      Divider(color: Colors.black.withOpacity(0.6), thickness: 2,)
                    ],
                  )
                  ).toList(),
                );
              }
              return Center(child: CircularProgressIndicator(),);
            },
          )
      ),

    );

  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  late String myEmail = ' ';
  final user = FirebaseAuth.instance.currentUser;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        actions: [
          /*FlatButton.icon(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              },
              icon: Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              label: Text(
                'Log out',
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ))*/
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: _fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return Text("Loading data...Please wait");
            return Text("Email : $myEmail");
          },
        ),
      ),
    );
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {

        myEmail= ds.data()!['email'];
        print(myEmail);
      }).catchError((e) {
        print(e);
      });
  }


}*/
