import 'package:assignment2/session_storage.dart';

void nameHandler(String name) {
  RegExp number = RegExp('[0-9]');
  if (name.length == 0 || number.hasMatch(name)) {
    throw Exception(
        "Name entered isn't valid, please enter appropriate details");
  }
}

void ensurePositive(int number) {
  if (number < 0) {
    throw Exception(
        "Number entered is not valid, please enter a positive number");
  }
}

void ensureRollNumber(int rollNumber) {
  if (currentSession.containsKey(rollNumber)) {
    throw Exception(
        "Roll Number already exists, please enter a new roll number");
  }
}

List<String> acceptCourses(String? courses) {
  List<String> registered = courses!.split(" ");
  if (registered.length != 4) {
    throw Exception("Registered courses should mandatorily be 4");
  }
  List<String> registered_courses = [];
  registered.forEach((element) {
    registered_courses.add(element.toUpperCase());
  });
  List<String> allowedCourses = ["A", "B", "C", "D", "E", "F"];
  for (String element in registered_courses) {
    if (allowedCourses.contains(element)) {
      allowedCourses.remove(element);
    } else {
      throw Exception(
          "Course Entered are wrong, please enter from the given courses");
    }
  }
  return registered_courses;
}

void checkRollNumber(int rollNumber) {
  if (!currentSession.containsKey(rollNumber)) {
    throw Exception('Roll Number : $rollNumber does not exist in the database');
  }
}
