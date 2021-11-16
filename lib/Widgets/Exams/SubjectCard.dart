import 'package:flutter/material.dart';
import 'package:randomizer/randomizer.dart';

class SubjectCard extends StatelessWidget {
  Randomizer randomcolor = Randomizer();
  final String subjectname;
  String chapter;
  String date;
  String time;
  String grade;
  int mark;

  SubjectCard({Key key, this.subjectname, this.chapter, this.date, this.time, this.grade, this.mark}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black38,
          offset: Offset(0, 2),
          spreadRadius: 1,
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 13,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: randomcolor.getrandomcolor(),
                  ),
                  height: height * 0.1,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        subjectname ?? "",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      chapter != null ? "${chapter} chapters" : "",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    date ?? "",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    time ?? "",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      mark != null ? "Marks:${mark}" : "",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      grade != null ? "Grade:${grade}" : "",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
