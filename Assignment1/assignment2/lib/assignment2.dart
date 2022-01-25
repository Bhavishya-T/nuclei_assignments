import 'package:assignment2/utilities.dart' as utilities;
import 'package:assignment2/users.dart';
import 'dart:io';

void addUser() {
  try {
    print('Enter Full Name :');
    String name = stdin.readLineSync()!;
    print('Enter Age :');
    int age = int.parse(stdin.readLineSync()!);
    print('Enter Address :');
    String address = stdin.readLineSync()!;
    print('Enter Roll Number :');
    int rollNumber = int.parse(stdin.readLineSync()!);
    print('Enter courses you want to enroll in (Choose 4 - A,B,C,D,E,F) :');
    String? courses = stdin.readLineSync();
    List<String> enrolledCourses = utilities.acceptCourses(courses);
    print(utilities.currentSession);
    Map<int, User> currentDetails = {
      rollNumber: User(name, age, rollNumber, address, enrolledCourses)
    };
    utilities.currentSession.addAll(currentDetails);
    print(utilities.currentSession);
  } catch (e) {
    print("$e");
  }
}

void displayUser() {
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
  utilities.displayMap(order, choice);
}

void deleteUser() {
  print("Enter user's roll number whose details you want to delete");
  int rollNumber = int.parse(stdin.readLineSync()!);
  utilities.currentSession.remove(rollNumber);
}

void saveUser() {}
