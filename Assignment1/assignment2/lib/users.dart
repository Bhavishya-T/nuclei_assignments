import 'dart:convert';
import 'dart:io';

class User {
  final String fullName, address;
  final int age, rollNumber;
  final List<String> courses;

  User(this.fullName, this.age, this.rollNumber, this.address, this.courses);

  String toJson() {
    return json.encode({
      'fullName': fullName,
      'age': age,
      'rollNumber': rollNumber,
      'address': address,
      'courses': courses
    });
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
