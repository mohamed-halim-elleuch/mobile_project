import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/Interfaces/objectives/objectives.dart';
import 'package:flutter_application_1/models/ObjectiveExplorer.dart';
import 'package:image_picker/image_picker.dart';

class DatabaseService {
  String? userID, objectiveID;
  DatabaseService({this.userID, this.objectiveID});
  // Déclaraction et Initialisation
  CollectionReference _objective1 = FirebaseFirestore.instance.collection('objective1');
  FirebaseStorage _storage = FirebaseStorage.instance;

  // upload de l'image vers Firebase Storage
  /*Future<String> uploadFile(File file, XFile fileWeb) async {
    Reference reference = _storage.ref().child('cars/${DateTime.now()}.png');
    Uint8List imageTosave = await fileWeb.readAsBytes();
    SettableMetadata metaData = SettableMetadata(contentType: 'image/jpeg');
    UploadTask uploadTask = kIsWeb
        ? reference.putData(imageTosave, metaData)
        : reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }*/

  // ajout de la voiture dans la BDD
 /* void addMission(ObjectiveExplorer object) {
    _objective1.add({
      'objectiveUserID':object.objectiveUserID,
      "mission": {"Roaming badge":[{'comment':'object.comment','place':'object.place','squad leader':'object.squadLeader','supervisor leader':'object.supervisorLeader'}]},
    });
  }

  // suppression de la voiture
  Future<void> deleteMission(String objectiveID) => _objective1.doc(objectiveID).delete();

  // Récuperation de toutes les voitures en temps réel
  Stream<List<ObjectiveExplorer>> get objective1 {
    Query queryMission = _objective1;
    return queryMission.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ObjectiveExplorer(
          objectiveID: doc.id,
          mission: doc.get('mission'),
          //comment: doc.get("mission['Roaming badge'][0]['comment']"),

          objectiveUserID: doc.get('objectiveUserID'),

        );
      }).toList();
    });
  }*/

  // ajout de la voiture favoris dans une sous-collection
  void addFavoriteMission1(ObjectiveExplorer obj, String userID,String badge) async {
    final carDocRef = _objective1.doc(obj.objectiveID);
    final favoritedBy = carDocRef.collection('$badge');
    //String increaseCount = obj.mission['Roaming badge'] + 'aaa';
    favoritedBy.doc(userID).set({
      "objectiveUserID": obj.objectiveUserID,
      "question 1": obj.question1,
      /*"question 2": obj.question2,
      "question 3": obj.question3,
      "question 4": obj.question4,*/
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
    //String increaseCount = obj.mission['Roaming badge'] + 'aaa';
    favoritedBy.doc(userID).set({
      "objectiveUserID": obj.objectiveUserID,
      /*"question 1": obj.question1,
      "question 2": obj.question2,*/
      "question 3": obj.question3,
      //"question 4": obj.question4,
    },SetOptions(merge: true)).then((_){
      print("success!");
    });
    carDocRef.update({"question 3": obj.question3});

    }
  void addFavoriteMission4(ObjectiveExplorer obj, String userID,String badge) async {
    final carDocRef = _objective1.doc(obj.objectiveID);
    final favoritedBy = carDocRef.collection('$badge');
    //String increaseCount = obj.mission['Roaming badge'] + 'aaa';
    favoritedBy.doc(userID).set({
      "objectiveUserID": obj.objectiveUserID,
      /*"question 1": obj.question1,
      "question 2": obj.question2,
      "question 3": obj.question3,*/
      "question 4": obj.question4,
    },SetOptions(merge: true)).then((_){
      print("success!");
    });
    carDocRef.update({"question 4": obj.question4});

    }

 /* // rétirer la voiture de la liste des favoris
  void removeFavoriteCar(Car car, String userID) {
    final carDocRef = _cars.doc(car.carID);
    final favoritedBy = carDocRef.collection('favoritedBy');
    int carFavoriteCount = car.carFavoriteCount!;
    int decreaseCount = carFavoriteCount -= 1;
    carDocRef.update({"carFavoriteCount": decreaseCount});
    favoritedBy.doc(userID).delete();
  }*/

  // Récuperation des voitures favoris de l'utilisateur en temps réel
  /*Stream<ObjectiveExplorer> get myFavoriteObjective {
    final favoritedBy = _objective1.doc(objectiveID).collection('favoritedBy');
    return favoritedBy.doc(userID).snapshots().map((doc) {
      return ObjectiveExplorer(
        objectiveID: doc.id,
        objectiveUserID: doc.get('objectiveUserID'),
        mission: doc.get('mission'),
      );
    });
  }*/

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
