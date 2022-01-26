import 'package:assignment2/users.dart';
import 'dart:collection';

Map<int, User> currentSession = Map();

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

void loadCurrentSession(Map<int, User> map) {
  currentSession = map;
}

SplayTreeMap<int, User> displayMap(String order, int option) {
  int orderInt = 0;
  if (order == 'a') {
    orderInt = 1;
  } else if (order == 'd') {
    orderInt = -1;
  } else {
    throw Exception("Entered order for sorting is invalid");
  }
  if (option < 1 && option > 4) {
    throw Exception(
        "Entered option is invalid, please enter appropriate option");
  }
  SplayTreeMap<int, User> result = SplayTreeMap();
  switch (option) {
    case 1:
      result = sortMapName(orderInt);
      break;
    case 2:
      result = sortMapRollNumber(orderInt);
      break;
    case 3:
      result = sortMapAge(orderInt);
      break;
    case 4:
      result = sortMapAddress(orderInt);
      break;
    default:
  }
  return result;
}

SplayTreeMap<int, User> sortMapName(int order) {
  Map<int, dynamic> map = currentSession;
  SplayTreeMap<int, User> result = SplayTreeMap<int, User>.from(
      map, (a, b) => map[a].name.compareTo(map[b].name) * order);
  return result;
}

SplayTreeMap<int, User> sortMapRollNumber(int order) {
  Map<int, dynamic> map = currentSession;
  SplayTreeMap<int, User> result = SplayTreeMap<int, User>.from(map,
      (a, b) => map[a].rollNumber > map[b].rollNumber ? order : -1 * order);
  return result;
}

SplayTreeMap<int, User> sortMapAge(int order) {
  Map<int, dynamic> map = currentSession;
  SplayTreeMap<int, User> result = SplayTreeMap<int, User>.from(
      map, (a, b) => map[a].age > map[b].age ? order : -1 * order);
  return result;
}

SplayTreeMap<int, User> sortMapAddress(int order) {
  Map<int, dynamic> map = currentSession;
  SplayTreeMap<int, User> result = SplayTreeMap<int, User>.from(
      map, (a, b) => map[a].address.compareTo(map[b].address) * order);
  return result;
}
