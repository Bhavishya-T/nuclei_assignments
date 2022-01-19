import 'types.dart' as types;

void generateBill(String name, double price, int quantity, String itemType) {
  double tax = 0.0;
  double total = 0.0;
  itemType.toLowerCase();
  switch (itemType) {
    case 'raw':
      var raw = types.Raw();
      tax = raw.calculateTax(price);
      total = raw.getTotal(tax, price, quantity);
      break;
    case 'manufactured':
      var manufactured = types.Manufactured();
      tax = manufactured.calculateTax(price);
      total = manufactured.getTotal(tax, price, quantity);
      break;
    case 'imported':
      var imported = types.Imported();
      tax = imported.calculateTax(price);
      total = imported.getTotal(tax, price, quantity);
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
