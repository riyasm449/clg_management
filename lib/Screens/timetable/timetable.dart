import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomizer/randomizer.dart';
import 'package:school_management/Widgets/AppBar.dart';
import 'package:school_management/Widgets/Exams/SubjectCard.dart';
import 'package:school_management/Widgets/MainDrawer.dart';
import 'package:school_management/providers/user.dart';

class TimeTablePage extends StatefulWidget {
  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  AnimationController animationController;
  Randomizer randomcolor = Randomizer();
  UserProvider userProvider;
  int selectedIndex = DateTime.now().weekday > 6 ? 0 : DateTime.now().weekday;
  List days = ["Mon", "Tue", "Wed", "Thu", "Fri"];
  void onTapped(int index) {
    setState(() {
      selectedIndex = index + 1;
    });
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation =
        Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: animationController, curve: Interval(0.2, 0.5, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: animationController, curve: Interval(0.3, 0.5, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    animationController.forward();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
          return Scaffold(
              key: _scaffoldKey,
              appBar: CommonAppBar(
                menuenabled: true,
                notificationenabled: false,
                title: "Time Table",
                ontap: () {
                  _scaffoldKey.currentState.openDrawer();
                },
              ),
              drawer: Drawer(
                elevation: 0,
                child: MainDrawer(),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Container(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            for (int i = 0; i < days.length; i++)
                              InkWell(
                                onTap: () => onTapped(i),
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(4),
                                      color: i == (selectedIndex - 1) ? Colors.grey : Colors.blueGrey[50]),
                                  alignment: Alignment.center,
                                  child: Text(days[i]),
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (selectedIndex == 1) tab(userProvider.timeTable.mon),
                      if (selectedIndex == 2) tab(userProvider.timeTable.tue),
                      if (selectedIndex == 3) tab(userProvider.timeTable.wed),
                      if (selectedIndex == 4) tab(userProvider.timeTable.thu),
                      if (selectedIndex == 5) tab(userProvider.timeTable.fri),
                      SizedBox(
                        height: height * 0.20,
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  Widget tab(List<String> list) {
    return Column(
      children: [
        for (int i = 0; i < list.length; i++)
          Transform(
            transform: Matrix4.translationValues(muchDelayedAnimation.value * MediaQuery.of(context).size.width, 0, 0),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SubjectCard(
                subjectname: list[i],
                date: "Hour: ${i + 1}",
              ),
            ),
          ),
      ],
    );
  }
}
