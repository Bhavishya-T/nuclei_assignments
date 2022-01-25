import 'dart:convert';
import 'dart:io';

import 'package:assignment2/utilities.dart' as utilities;

class User {
  final String fullName, address;
  final int age, rollNumber;
  final List<String> courses;

  User(this.fullName, this.age, this.rollNumber, this.address, this.courses);

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'age': age.toString(),
      'rollNumber': rollNumber.toString(),
      'address': address,
      'courses': courses
    };
  }

  static User fromJson(Map data) {
    var userMap = data;
    var user = User(
        userMap['fullName'],
        int.parse(userMap['age']),
        int.parse(userMap['rollNumber']),
        userMap['address'],
        userMap['courses'].map<String>((value) => value as String).toList());
    return user;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

Map<int, User> loadJSON() {
  Map<String, dynamic> mapString = Map();
  String contents = File(
          '/Users/bhavishya/nuclei_assignments/Assignment1/assignment2/lib/assets/user_details.json')
      .readAsStringSync();
  mapString = json.decode(contents);
  Map<int, User> result = mapString.map<int, User>((key, value) {
    return MapEntry(int.parse(key), User.fromJson(value));
  });
  return result;
}

void saveJSON() {
  Map<String, dynamic> result = utilities.currentSession.map((key, value) {
    return MapEntry(key.toString(), value.toJson());
  });
  File file = File(
      '/Users/bhavishya/nuclei_assignments/Assignment1/assignment2/lib/assets/user_details.json');
  file.writeAsStringSync(json.encode(result));
}
