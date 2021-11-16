class User {
  String name;
  String dept;
  int year;
  String id;
  User({this.name, this.dept, this.year, this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dept = json['dept'];
    year = json['year'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dept'] = this.dept;
    data['year'] = this.year;
    data['id'] = this.id;
    return data;
  }
}
