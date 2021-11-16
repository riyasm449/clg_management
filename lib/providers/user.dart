import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import 'package:school_management/model/exam.dart';
import 'package:school_management/model/timetable.dart';
import "package:school_management/model/user.dart";

class UserProvider extends ChangeNotifier {
  User _user;
  ExamMarks _examMarks;
  TimeTable _timeTable;

  //getters
  User get user => _user;
  ExamMarks get examMarks => _examMarks;
  TimeTable get timeTable => _timeTable;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  setUser(String id) async {
    try {
      DocumentSnapshot userData = await _firestore.collection("user").doc(id).get();
      DocumentSnapshot examData = await _firestore.collection("marks").doc(id).get();
      DocumentSnapshot ttData = await _firestore.collection("timetable").doc(id).get();

      _user = User.fromJson(userData.data());
      _examMarks = ExamMarks.fromJson(examData.data());
      _timeTable = TimeTable.fromJson(ttData.data());
      print(_examMarks.marks.length);
    } catch (e) {
      print("======error=========");
      print(e);
    }
    notifyListeners();
  }
}
