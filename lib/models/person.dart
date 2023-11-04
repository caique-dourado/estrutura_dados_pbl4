import 'dart:convert';

class Person {
  final String name;
  final String sex;
  final String dtBirth;
  final int age;
  final String country;
  final String occupation;
  final double salary;

  Person({
    required this.name,
    required this.sex,
    required this.dtBirth,
    required this.age,
    required this.country,
    required this.occupation,
    required this.salary,
  });

  Map<String, dynamic> toMap() {
    return {
      "Name": name,
      "Sex": sex,
      "Dt_birth": dtBirth,
      "Age": age,
      "Country": country,
      "Ocuppation": occupation,
      "Salary": salary,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
        name: map["Name"],
        sex: map["Sex"],
        dtBirth: map["Dt_birth"],
        age: map["Age"],
        country: map["Country"],
        occupation: map["Occupation"],
        salary: map["Salary"]);
  }
  factory Person.fromJson(String json) => Person.fromMap(jsonDecode(json));
}
