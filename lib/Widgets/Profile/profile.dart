import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/Widgets/AppBar.dart';
import 'package:school_management/providers/user.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  UserProvider userProvider;
  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: CommonAppBar(
        menuenabled: true,
        notificationenabled: true,
        ontap: () {
          _scaffoldKey.currentState.openDrawer();
        },
        title: "Profile",
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/profile.png",
              width: 150,
              // height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Name: ${userProvider.user.name}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "ID: ${userProvider.user.id}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "Year: ${userProvider.user.year}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "Department: ${userProvider.user.dept}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
