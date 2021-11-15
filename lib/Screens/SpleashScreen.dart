import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:school_management/Screens/LoginPage.dart';

class SpleashScreen extends StatefulWidget {
  @override
  _SpleashScreenState createState() => _SpleashScreenState();
}

class _SpleashScreenState extends State<SpleashScreen> {
  @override
  void initState() {
    Firebase.initializeApp();

    Timer(Duration(seconds: 3), start);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(width: MediaQuery.of(context).size.width * 0.7, child: Image.asset('assets/logo.png')),
            Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Student's Corner",
                  style: TextStyle(color: Colors.blueGrey.withOpacity(.6), fontSize: 25.0, fontWeight: FontWeight.bold),
                )),
            Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Please wait loading...",
                  style: TextStyle(color: Colors.white.withOpacity(.3), fontSize: 14, fontWeight: FontWeight.bold),
                )),
            Spacer(),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: Text(
                  "By Harshini & Sasimeena",
                  style: TextStyle(color: Colors.white.withOpacity(.8), fontSize: 18, fontWeight: FontWeight.bold),
                )),
            // Spacer(),
          ],
        ),
      ),
    );
  }

  start() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MyHomePage(),
        ),
      );
    });
  }
}
