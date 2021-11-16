class ExamMarks {
  List<Marks> marks;
  int overall;
  String og;

  ExamMarks({this.marks, this.overall, this.og});

  ExamMarks.fromJson(Map<String, dynamic> json) {
    if (json['marks'] != null) {
      marks = new List<Marks>();
      json['marks'].forEach((v) {
        marks.add(new Marks.fromJson(v));
      });
    }
    overall = json['overall'];
    og = json['og'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.marks != null) {
      data['marks'] = this.marks.map((v) => v.toJson()).toList();
    }
    data['overall'] = this.overall;
    data['og'] = this.og;
    return data;
  }
}

class Marks {
  String sub;
  int mark;
  String date;
  String grade;

  Marks({this.sub, this.mark, this.date, this.grade});

  Marks.fromJson(Map<String, dynamic> json) {
    sub = json['sub'];
    mark = json['mark'];
    date = json['date'];
    grade = json['grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub'] = this.sub;
    data['mark'] = this.mark;
    data['date'] = this.date;
    data['grade'] = this.grade;
    return data;
  }
}
