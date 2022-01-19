class Type {
  double calculateTax(double price) {
    return 0.0;
  }

  double getTotal(double tax, double price, int quanitity) {
    return (tax + price) * quanitity;
  }
}

class Raw extends Type {
  @override
  double calculateTax(double price) {
    return price * 0.125;
  }
}

class Manufactured extends Type {
  @override
  double calculateTax(double price) {
    return price * 0.125 + (price * 0.125 + price) * 0.02;
  }
}

class Imported extends Type {
  @override
  double calculateTax(double price) {
    double total = price + price * 0.1;
    if (total <= 100) {
      return total + 5;
    } else if (total > 100 && total <= 200) {
      return total + 10;
    } else {
      return total + total * 0.05;
    }
  }
}
