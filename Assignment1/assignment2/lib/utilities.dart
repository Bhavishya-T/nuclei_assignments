import 'package:assignment2/session_storage.dart';
import 'package:assignment2/validations.dart';

class Validators {
  static void nameValidator(String name) {
    RegExp number = RegExp('[0-9]');
    if (name.length == 0 || number.hasMatch(name)) {
      throw InvalidName(
          "Name entered isn't valid, please enter appropriate details");
    }
  }

  static void ensurePositive(int number) {
    if (number < 0) {
      throw InvalidRollNumber(
          "Number entered is not valid, please enter a positive number");
    }
  }

  static void rollNumberValidator(int rollNumber) {
    if (currentSession.containsKey(rollNumber)) {
      throw InvalidRollNumber(
          "Roll Number already exists, please enter a new roll number");
    }
  }

  static List<String> acceptCourses(String? courses) {
    List<String> registered = courses!.split(" ");
    if (registered.length != 4) {
      throw InvalidCourseException(
          "Registered courses should mandatorily be 4");
    }
    List<String> registered_courses = [];
    registered.forEach((element) {
      registered_courses.add(element.toUpperCase());
    });
    const List<String> allowedCourses = ["A", "B", "C", "D", "E", "F"];
    for (String element in registered_courses) {
      if (allowedCourses.contains(element)) {
        allowedCourses.remove(element);
      } else {
        throw InvalidCourseException(
            "Course Entered are wrong, please enter from the given courses");
      }
    }
    return registered_courses;
  }

  static void checkRollNumber(int rollNumber) {
    if (!currentSession.containsKey(rollNumber)) {
      throw InvalidRollNumber(
          'Roll Number : $rollNumber does not exist in the database');
    }
  }
}
