import 'package:cloud_firestore/cloud_firestore.dart';

class ObjectiveExplorer {
  var mission;
  var badge;
  String? objectiveID,comment, date, place, squadLeader, supervisorLeader,objectiveUserID;

  ObjectiveExplorer(

      {
        required this.objectiveID,
        required this.objectiveUserID,
        required this.mission
        /*required this.badge,
        required this.comment,
        required this.date,
        required this.place,
        required this.squadLeader,
        required this.supervisorLeader,*/
        });
}
