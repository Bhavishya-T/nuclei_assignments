import 'dart:collection';
import 'package:assignment2/users.dart';
import 'package:assignment2/session_storage.dart';

class MapUtils {
  static SplayTreeMap<int, User> displayMap(String order, int option) {
    const int SORT_BY_NAME = 1;
    const int SORT_BY_ROLL_NUMBER = 2;
    const int SORT_BY_AGE = 3;
    const int SORT_BY_ADDRESS = 4;
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
      case SORT_BY_NAME:
        result = sortMapName(orderInt);
        break;
      case SORT_BY_ROLL_NUMBER:
        result = sortMapRollNumber(orderInt);
        break;
      case SORT_BY_AGE:
        result = sortMapAge(orderInt);
        break;
      case SORT_BY_ADDRESS:
        result = sortMapAddress(orderInt);
        break;
      default:
    }
    return result;
  }

  //Sorting the given map according to the passed order -> ascending or descending into a splaytreemap
  static SplayTreeMap<int, User> sortMapName(int order) {
    Map<int, dynamic> map = currentSession;
    SplayTreeMap<int, User> result = SplayTreeMap<int, User>.from(
        map, (a, b) => map[a].fullName.compareTo(map[b].fullName) * order);
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
