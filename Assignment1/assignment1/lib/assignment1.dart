import 'package:assignment1/Types.dart';

import 'types.dart';

class Bill {
  static const RAW_ITEM_TYPE = 'raw';
  static const MANUFACTURED_ITEM_TYPE = 'manufactured';
  static const IMPORTED_ITEM_TYPE = 'imported';
  static void generateBill(
      String name, double price, int quantity, String itemType) {
    double tax = 0.0;
    double total = 0.0;
    itemType.toLowerCase();
    switch (itemType) {
      case RAW_ITEM_TYPE:
        var raw = RawItem();
        tax = raw.calculateTax(price);
        total = raw.getTotal(price, quantity);
        break;
      case MANUFACTURED_ITEM_TYPE:
        var manufactured = ManufacturedItem();
        tax = manufactured.calculateTax(price);
        total = manufactured.getTotal(price, quantity);
        break;
      case IMPORTED_ITEM_TYPE:
        var imported = ImportedItem();
        tax = imported.calculateTax(price);
        total = imported.getTotal(price, quantity);
        break;
      default:
        throw Exception(
            'Entered Item type does not exist, please enter either raw, manufactured or imported');
    }
    print('Item Name     : $name');
    print('Item Price    : $price');
    print('Tax Per Item  : $tax');
    print('Item Quantity : $quantity');
    print('Final Price   : $total');
  }
}
