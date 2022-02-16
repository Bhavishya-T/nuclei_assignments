import 'package:assignment1/assignment1.dart';
import 'dart:io';
import 'package:assignment1/handler.dart' as handler;

void main(List<String> arguments) {
  do {
    try {
      print('Enter name of the item');
      String? name = stdin.readLineSync();
      print('Enter price of the item');
      double? price = double.parse(stdin.readLineSync()!);
      handler.ensurePositive(price);
      print('Enter quantity of the item');
      int? quantity = int.parse(stdin.readLineSync()!);
      handler.ensurePositive(quantity);
      print('Enter type of the item - raw, manufactured, imported');
      String? itemType = stdin.readLineSync();
      Bill.generateBill(name!, price, quantity, itemType!);
    } on FormatException {
      print(
          "Entered field is supposed to be a number, please enter appropriate value");
    } catch (exception) {
      print(exception);
    }
    print('Do you want to enter details of another item (y/n):');
  } while (stdin.readLineSync() == 'y');
}
