import 'Types.dart' as Types;

void create(String name, int price, int quantity, String type) {
  double tax = 0.0;
  double total = 0.0;
  type.toLowerCase();
  switch (type) {
    case 'raw':
      tax = Types.Raw().calculate(price);
      break;
    case 'manufactured':
      tax = Types.Manufactured().calculate(price);
      break;
    case 'imported':
      tax = Types.Imported().calculate(price);
      break;
    default:
      print('None');
  }
  total = (tax + price) * quantity;
  print('Item Name    : $name');
  print('Item Price   : $price');
  print('Tax Per Item : $tax');
  print('Final Price  : $total');
}
