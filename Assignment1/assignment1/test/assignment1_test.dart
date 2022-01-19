import 'package:assignment1/types.dart' as types;
import 'package:test/test.dart';

void main() {
  group("Testing sales tax of items", () {
    test("Item 1 - Raw", () {
      var raw = types.Raw();
      expect(15.6875, raw.calculateTax(125.5));
    });
    test("Item 2 - Manufactured", () {
      var manufactured = types.Manufactured();
      expect(116.41142500000001, manufactured.calculateTax(789.23));
    });
    test("Item 3 - Imported", () {
      var imported = types.Imported();
      expect(13.6, imported.calculateTax(86));
    });
  });
  group("Testing total price of items", () {
    test("Item 1 - Raw", () {
      var raw = types.Raw();
      expect(12565.6875, raw.getTotal(15.6875, 125.5, 89));
    });
    test("Item 2 - Manufactured", () {
      var manufactured = types.Manufactured();
      expect(
          40753.864125, manufactured.getTotal(116.41142500000001, 789.23, 45));
    });
    test("Item 3 - Imported", () {
      var imported = types.Imported();
      expect(1294.8, imported.getTotal(13.6, 86, 13));
    });
  });
}
