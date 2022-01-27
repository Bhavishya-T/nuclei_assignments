import 'dart:collection';
import 'package:assignment2/users.dart';
import 'package:assignment2/session_storage.dart';

class MapUtils {
  static SplayTreeMap<int, User> displayMap(String order, int option) {
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

  static SplayTreeMap<int, User> sortMapName(int order) {
    Map<int, dynamic> map = currentSession;
    SplayTreeMap<int, User> result = SplayTreeMap<int, User>.from(
        map, (a, b) => map[a].name.compareTo(map[b].name) * order);
    return result;
  }

  static SplayTreeMap<int, User> sortMapRollNumber(int order) {
    Map<int, dynamic> map = currentSession;
    SplayTreeMap<int, User> result = SplayTreeMap<int, User>.from(map,
        (a, b) => map[a].rollNumber > map[b].rollNumber ? order : -1 * order);
    return result;
  }

  static SplayTreeMap<int, User> sortMapAge(int order) {
    Map<int, dynamic> map = currentSession;
    SplayTreeMap<int, User> result = SplayTreeMap<int, User>.from(
        map, (a, b) => map[a].age > map[b].age ? order : -1 * order);
    return result;
  }

  static SplayTreeMap<int, User> sortMapAddress(int order) {
    Map<int, dynamic> map = currentSession;
    SplayTreeMap<int, User> result = SplayTreeMap<int, User>.from(
        map, (a, b) => map[a].address.compareTo(map[b].address) * order);
    return result;
  }
}
