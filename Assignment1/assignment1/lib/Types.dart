import 'package:assignment1/constants.dart';

abstract class ItemType {
  late double tax;

  double calculateTax(double price);

  double getTotal(double price, int quanitity) {
    return (tax + price) * quanitity;
  }
}

class RawItem extends ItemType {
  @override
  double calculateTax(double price) {
    tax = price * Constants.RAW_ITEM_PERCENTAGE;
    return tax;
  }
}

class ManufacturedItem extends ItemType {
  @override
  double calculateTax(double price) {
    tax = price * Constants.MANUFACTURED_ITEM_PERCENTAGE +
        (price * Constants.MANUFACTURED_ITEM_PERCENTAGE + price) *
            Constants.MANUFACTURED_ITEM_PERCENTAGE_EXTRA;
    return tax;
  }
}

class ImportedItem extends ItemType {
  @override
  double calculateTax(double price) {
    double _tax = price * Constants.IMPORTED_ITEM_PERCENTAGE;
    double total = price + _tax;
    if (total <= 100) {
      tax = _tax + 5;
    } else if (total > 100 && total <= 200) {
      tax = _tax + 10;
    } else {
      tax = _tax + total * Constants.IMPORTED_ITEM_PERCENTAGE_EXTRA;
    }
    return tax;
  }
}
