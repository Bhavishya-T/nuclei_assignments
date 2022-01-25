import 'package:assignment2/users.dart';
import 'dart:collection';

Map<int, User> currentSession = Map();

List<String> acceptCourses(String? courses) {
  List<String> registered_courses = courses!.split(" ");
  if (registered_courses.length != 4) {
    throw Exception("Registered courses should mandatorily be 4");
  }
  return registered_courses;
}

void loadCurrentSession(Map<int, User> map) {
  currentSession = map;
}

void displayMap(String order, int option) {
  int orderInt = 0;
  if (order == 'a') {
    orderInt = 1;
  } else {
    orderInt = -1;
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
  print('''
  --------------------------------------------------------------------------------------------------------------------------------
Name    Roll Number                       Age                      Address                        Courses
--------------------------------------------------------------------------------------------------------------------------------- 
  ''');
  result.forEach((key, value) {
    print('''
      $value    
  ''');
  });
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
