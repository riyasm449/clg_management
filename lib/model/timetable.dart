class TimeTable {
  List<String> mon;
  List<String> tue;
  List<String> wed;
  List<String> thu;
  List<String> fri;

  TimeTable({this.mon, this.tue, this.wed, this.thu, this.fri});

  TimeTable.fromJson(Map<String, dynamic> json) {
    mon = json['mon'].cast<String>();
    tue = json['tue'].cast<String>();
    wed = json['wed'].cast<String>();
    thu = json['thu'].cast<String>();
    fri = json['fri'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mon'] = this.mon;
    data['tue'] = this.tue;
    data['wed'] = this.wed;
    data['thu'] = this.thu;
    data['fri'] = this.fri;
    return data;
  }
}
