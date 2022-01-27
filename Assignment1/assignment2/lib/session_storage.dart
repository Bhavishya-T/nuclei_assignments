import 'package:assignment2/users.dart' as users;
import 'dart:convert';
import 'dart:io';

Map<int, users.User> currentSession = Map();

class SessionStorage {
  static Map<int, users.User> loadJSON() {
    Map<String, dynamic> mapString = Map();
    String contents = File(
            '/Users/bhavishya/nuclei_assignments/Assignment1/assignment2/lib/assets/user_details.json')
        .readAsStringSync();
    mapString = json.decode(contents);
    Map<int, users.User> result = mapString.map<int, users.User>((key, value) {
      return MapEntry(int.parse(key), users.User.fromJson(value));
    });
    return result;
  }

  static void loadCurrentSession(Map<int, users.User> map) {
    currentSession = map;
  }

  static void saveJSON() {
    Map<String, dynamic> result = currentSession.map((key, value) {
      return MapEntry(key.toString(), value.toJson());
    });
    File file = File(
        '/Users/bhavishya/nuclei_assignments/Assignment1/assignment2/lib/assets/user_details.json');
    file.writeAsStringSync(json.encode(result));
  }
}
