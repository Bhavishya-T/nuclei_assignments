import 'types.dart' as types;

void create(String name, int price, int quantity, String type) {
  double tax = 0.0;
  double total = 0.0;
  type.toLowerCase();
  switch (type) {
    case 'raw':
      tax = types.Raw().calculate(price);
      break;
    case 'manufactured':
      tax = types.Manufactured().calculate(price);
      break;
    case 'imported':
      tax = types.Imported().calculate(price);
      break;
    default:
      throw new Exception();
  }
  total = (tax + price) * quantity;
  print('Item Name    : $name');
  print('Item Price   : $price');
  print('Tax Per Item : $tax');
  print('Final Price  : $total');
}
