import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/views/objectives.dart';
import 'package:flutter_application_1/models/ObjectiveExplorer.dart';
import 'package:image_picker/image_picker.dart';

class DatabaseService {
  String? userID, objectiveID;
  DatabaseService({this.userID, this.objectiveID});
  CollectionReference _objective1 = FirebaseFirestore.instance.collection('objective1');
  FirebaseStorage _storage = FirebaseStorage.instance;

  void addFavoriteMission1(ObjectiveExplorer obj, String userID,String badge) async {
    final carDocRef = _objective1.doc(obj.objectiveID);
    final favoritedBy = carDocRef.collection('$badge');
    favoritedBy.doc(userID).set({
      "objectiveUserID": obj.objectiveUserID,
      "question 1": obj.question1,
    },SetOptions(merge: true)).then((_){
      print("success!");
    });
    carDocRef.update({"question 1": obj.question1});

  }
  void addFavoriteMission2(ObjectiveExplorer obj, String userID,String badge) async {
    final carDocRef = _objective1.doc(obj.objectiveID);
    final favoritedBy = carDocRef.collection('$badge');
    //String increaseCount = obj.mission['Roaming badge'] + 'aaa';
    favoritedBy.doc(userID).set({
      "objectiveUserID": obj.objectiveUserID,
      //"question 1": obj.question1,
      "question 2": obj.question2,
      /*"question 3": obj.question3,
      "question 4": obj.question4,*/
    },SetOptions(merge: true)).then((_){
      print("success!");
    });
    carDocRef.update({"question 2": obj.question2});

    }
  void addFavoriteMission3(ObjectiveExplorer obj, String userID,String badge) async {
    final carDocRef = _objective1.doc(obj.objectiveID);
    final favoritedBy = carDocRef.collection('$badge');
    favoritedBy.doc(userID).set({
      "objectiveUserID": obj.objectiveUserID,
      "question 3": obj.question3,
    },SetOptions(merge: true)).then((_){
      print("success!");
    });
    carDocRef.update({"question 3": obj.question3});

    }
  void addFavoriteMission4(ObjectiveExplorer obj, String userID,String badge) async {
    final carDocRef = _objective1.doc(obj.objectiveID);
    final favoritedBy = carDocRef.collection('$badge');
    favoritedBy.doc(userID).set({
      "objectiveUserID": obj.objectiveUserID,
      "question 4": obj.question4,
    },SetOptions(merge: true)).then((_){
      print("success!");
    });
    carDocRef.update({"question 4": obj.question4});

    }

  Future<ObjectiveExplorer> singlebadge(String objectiveID) async {
    final doc = await _objective1.doc(objectiveID).get();
    return ObjectiveExplorer(
      objectiveID: objectiveID,
      objectiveUserID: doc.get('objectiveUserID'),
        question1: doc.get('question 1'),
        question2: doc.get('question 2'),
        question3: doc.get('question 3'),
      question4: doc.get('question 4')

    );
}}
