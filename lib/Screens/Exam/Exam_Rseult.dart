import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomizer/randomizer.dart';
import 'package:school_management/Widgets/AppBar.dart';
import 'package:school_management/Widgets/Exams/SubjectCard.dart';
import 'package:school_management/Widgets/MainDrawer.dart';
import 'package:school_management/providers/user.dart';

class ExamResult extends StatefulWidget {
  @override
  _ExamResultState createState() => _ExamResultState();
}

class _ExamResultState extends State<ExamResult> with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  AnimationController animationController;
  Randomizer randomcolor = Randomizer();
  UserProvider userProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays([]);

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
                title: "Results",
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
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform(
                              transform: Matrix4.translationValues(muchDelayedAnimation.value * width, 0, 0),
                              child: Text(
                                "Exam Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(delayedAnimation.value * width, 0, 0),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "date-15/12/2020",
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      for (int i = 0; i < userProvider.examMarks.marks.length; i++)
                        Transform(
                          transform: Matrix4.translationValues(muchDelayedAnimation.value * width, 0, 0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SubjectCard(
                              subjectname: userProvider.examMarks.marks[i].sub,
                              chapter: "1-5",
                              date: userProvider.examMarks.marks[i].date,
                              grade: userProvider.examMarks.marks[i].grade,
                              mark: userProvider.examMarks.marks[i].mark,
                              time: "9.00Am-10AM",
                            ),
                          ),
                        ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Transform(
                                transform: Matrix4.translationValues(muchDelayedAnimation.value * width, 0, 0),
                                child: Text(
                                  "Total Marks:",
                                  style: TextStyle(
                                    fontSize: 15,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: height * 0.03,
                              ),
                              Transform(
                                transform: Matrix4.translationValues(delayedAnimation.value * width, 0, 0),
                                child: Text(
                                  "${userProvider.examMarks.overall}/600",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              Transform(
                                transform: Matrix4.translationValues(muchDelayedAnimation.value * width, 0, 0),
                                child: Text(
                                  "Overall Grade:",
                                  style: TextStyle(
                                    fontSize: 15,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: height * 0.03,
                              ),
                              Transform(
                                transform: Matrix4.translationValues(delayedAnimation.value * width, 0, 0),
                                child: Text(
                                  "${userProvider.examMarks.og}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13.0),
                        child: Row(
                          children: [
                            Transform(
                              transform: Matrix4.translationValues(muchDelayedAnimation.value * width, 0, 0),
                              child: Text(
                                "Result: ",
                                style: TextStyle(
                                  fontSize: 15,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: height * 0.03,
                            ),
                            Transform(
                              transform: Matrix4.translationValues(delayedAnimation.value * width, 0, 0),
                              child: Text(
                                "Pass",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(0, 18, 0, 5),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Transform(
                      //         transform: Matrix4.translationValues(muchDelayedAnimation.value * width, 0, 0),
                      //         child: Bouncing(
                      //           onPress: () {},
                      //           child: Container(
                      //             decoration: BoxDecoration(
                      //                 color: Colors.blue,
                      //                 borderRadius: BorderRadius.circular(3),
                      //                 boxShadow: [
                      //                   BoxShadow(
                      //                     color: Colors.black26,
                      //                   ),
                      //                 ]),
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(8.0),
                      //               child: Text(
                      //                 "Save",
                      //                 style: TextStyle(
                      //                   fontSize: 15,
                      //                   color: Colors.white,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Transform(
                      //         transform: Matrix4.translationValues(delayedAnimation.value * width, 0, 0),
                      //         child: Bouncing(
                      //           onPress: () {},
                      //           child: Container(
                      //             decoration: BoxDecoration(
                      //                 color: Colors.blue,
                      //                 borderRadius: BorderRadius.circular(3),
                      //                 boxShadow: [
                      //                   BoxShadow(
                      //                     color: Colors.black26,
                      //                   ),
                      //                 ]),
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(8.0),
                      //               child: Text(
                      //                 "Share",
                      //                 style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 15,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: height * 0.20,
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
