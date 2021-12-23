import 'package:cloud_firestore/cloud_firestore.dart';

class ObjectiveExplorer {
  var mission;
  var badge;
  String? objectiveID, supervisorLeader,objectiveUserID;
  var question1, question2, question3, question4;

  ObjectiveExplorer(

      {
        required this.objectiveID,
        required this.objectiveUserID,
        required this.question1,
        required this.question2,
        required this.question3,
        required this.question4,

        });
}
