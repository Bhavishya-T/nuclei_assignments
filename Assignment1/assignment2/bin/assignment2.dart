import 'package:assignment2/assignment2.dart';
import 'package:assignment2/users.dart' as users;
import 'package:assignment2/session_storage.dart' as sessionStorage;
import 'dart:io';

void main(List<String> arguments) {
  Map<int, users.User> currentSession =
      sessionStorage.SessionStorage.loadJSON();
  sessionStorage.SessionStorage.loadCurrentSession(currentSession);
  int choice = 0;
  do {
    print('''
    Select an option:
    1. Add User details
    2. Display User details
    3. Delete User details
    4. Save User details
    5. Exit
    ''');

    try {
      choice = int.parse(stdin.readLineSync().toString());
      switch (choice) {
        case 1:
          UserUtils.addUser();
          break;
        case 2:
          UserUtils.displayUser();
          break;
        case 3:
          UserUtils.deleteUser();
          break;
        case 4:
          UserUtils.saveUser();
          break;
        case 5:
          break;
        default:
          throw Exception("Please select one of the 5 options");
      }
    } catch (error) {
      print("$error");
    }
  } while (choice != 5);
}
