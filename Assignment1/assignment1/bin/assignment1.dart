import 'package:assignment1/assignment1.dart' as assignment1;
import 'dart:io';

void main(List<String> arguments) {
  do {
    print('Enter name of the item');
    String? name = stdin.readLineSync();
    print('Enter price of the item');
    int? price = int.parse(stdin.readLineSync()!);
    print('Enter quantity of the item');
    int? quantity = int.parse(stdin.readLineSync()!);
    print('Enter type of the item - raw, manufactured, imported');
    String? type = stdin.readLineSync();
    assignment1.create(name!, price, quantity, type!);
    print('Do you want to enter details of any other item (y/n):');
  } while (stdin.readLineSync() == 'y');
}
