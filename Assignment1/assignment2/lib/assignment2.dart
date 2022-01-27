import 'package:assignment2/utilities.dart' as utilities;
import 'package:assignment2/users.dart' as users;
import 'package:assignment2/session_storage.dart' as sessionStorage;
import 'package:assignment2/map_utils.dart' as map_utils;
import 'dart:io';
import 'dart:collection';

void addUser() {
  try {
    print('Enter Full Name :');
    String name = stdin.readLineSync()!;
    utilities.nameHandler(name);
    print('Enter Age :');
    int age = int.parse(stdin.readLineSync()!);
    utilities.ensurePositive(age);
    print('Enter Address :');
    String address = stdin.readLineSync()!;
    print('Enter Roll Number :');
    int rollNumber = int.parse(stdin.readLineSync()!);
    utilities.ensurePositive(rollNumber);
    utilities.ensureRollNumber(rollNumber);
    print('Enter courses you want to enroll in (Choose 4 - A,B,C,D,E,F) :');
    String? courses = stdin.readLineSync();
    List<String> enrolledCourses = utilities.acceptCourses(courses);
    Map<int, users.User> currentDetails = {
      rollNumber: users.User(name, age, rollNumber, address, enrolledCourses)
    };
    sessionStorage.currentSession.addAll(currentDetails);
    print(sessionStorage.currentSession);
  } catch (e) {
    print("$e");
  }
}

void displayUser() {
  try {
    print(
        "Do you want to sort the users in ascending or descending order? (a/d)");
    final String order = stdin.readLineSync()!;
    print("On what basis should the users be sort, choose option from below :");
    print('''
  1. Name
  2. Roll Number
  3. Age
  4. Address
  ''');
    final int choice = int.parse(stdin.readLineSync()!);
    SplayTreeMap<int, users.User> result =
        map_utils.MapUtils.displayMap(order, choice);
    print('''
  --------------------------------------------------------------------------------------------------------------------------------
Name    Roll Number                       Age                      Address                        Courses
--------------------------------------------------------------------------------------------------------------------------------- 
  ''');
    result.forEach((key, value) {
      print(
          '${value.fullName} \t\t ${value.rollNumber} \t\t ${value.age} \t\t ${value.address} \t\t ${value.courses}');
    });
  } catch (e) {
    print("$e");
  }
}

void deleteUser() {
  try {
    print("Enter user's roll number whose details you want to delete");
    int rollNumber = int.parse(stdin.readLineSync()!);
    utilities.checkRollNumber(rollNumber);
    sessionStorage.currentSession.remove(rollNumber);
  } catch (e) {
    print('$e');
  }
}

void saveUser() {
  sessionStorage.SessionStorage.saveJSON();
}
