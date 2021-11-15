import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management/Screens/Attendance/Attendance.dart';
import 'package:school_management/Screens/Exam/Exam_Rseult.dart';
import 'package:school_management/Screens/Leave_Apply/Leave_apply.dart';
import 'package:school_management/Screens/home.dart';
import 'package:school_management/Widgets/DrawerListTile.dart';
import 'package:school_management/Widgets/Fees/fees.dart';
import 'package:school_management/Widgets/Profile/profile.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
            child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/profile.png",
                width: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Harshini",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            )
          ],
        )),
        DrawerListTile(
            imgpath: "profile.png",
            name: "Profile",
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ProfilePage(),
                ),
              );
            }),
        DrawerListTile(
            imgpath: "home.png",
            name: "Home",
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Home(),
                ),
              );
            }),
        DrawerListTile(
          imgpath: "attendance.png",
          name: "Attendance",
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Attendance(),
              ),
            );
          },
        ),
        // DrawerListTile(
        //     imgpath: "classroom.png", name: "Class work", ontap: () {}),
        DrawerListTile(
          imgpath: "exam.png",
          name: "Examination",
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ExamResult(),
              ),
            );
          },
        ),
        DrawerListTile(
            imgpath: "fee.png",
            name: "Fees",
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => FeesPage(),
                ),
              );
            }),
        DrawerListTile(imgpath: "calendar.png", name: "Time Table", ontap: () {}),
        // DrawerListTile(imgpath: "library.png", name: "Library", ontap: () {}),
        // DrawerListTile(imgpath: "downloads.png", name: "Downloads"),
        // DrawerListTile(imgpath: "bus.png", name: "Track ", ontap: () {}),
        DrawerListTile(
          imgpath: "leave_apply.png",
          name: "Leave apply",
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => LeaveApply(),
              ),
            );
          },
        ),
        // DrawerListTile(imgpath: "activity.png", name: "Activity", ontap: () {}),
        DrawerListTile(imgpath: "notification.png", name: "Notification", ontap: () {}),
      ],
    );
  }
}
