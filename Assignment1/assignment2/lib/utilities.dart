import 'package:assignment2/users.dart';
import 'dart:collection';

Map<int, User> currentSession = Map();

void nameHandler(String name) {
  if (name.length == 0 || name.contains('[0-9]')) {
    throw Exception(
        "Name entered isn't valid, please enter appropriate details");
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
  for (String element in registered_courses) {
    if (element != 'A' ||
        element != 'B' ||
        element != 'C' ||
        element != 'D' ||
        element != 'E' ||
        element != 'F') {
      throw Exception(
          "The courses entered are invalid, please enter only - A,B,C,D,E,F");
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
  SplayTreeMap<int, User> result = SplayTreeMap();
  switch (option) {
    case 1:
      result = sortMapString(orderInt, 'fullName');
      break;
    case 2:
      result = sortMapInt(orderInt, 'rollNumber');
      break;
    case 3:
      result = sortMapInt(orderInt, 'age');
      break;
    case 4:
      result = sortMapString(orderInt, 'address');
      break;
    default:
  }
  return result;
}

SplayTreeMap<int, User> sortMapString(int order, String option) {
  Map<int, dynamic> map = currentSession;
  SplayTreeMap<int, User> result = SplayTreeMap<int, User>.from(
      map, (a, b) => map[a].option.compareTo(map[b].option) * order);
  return result;
}

SplayTreeMap<int, User> sortMapInt(int order, String option) {
  Map<int, dynamic> map = currentSession;
  SplayTreeMap<int, User> result = SplayTreeMap<int, User>.from(
      map, (a, b) => map[a].option < map[b].option ? order : -1 * order);
  return result;
}
