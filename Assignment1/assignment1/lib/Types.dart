abstract class Type {
  double calculate(int price);
}

class Raw extends Type {
  double calculate(int price) {
    return price * 0.125;
  }
}

class Manufactured extends Type {
  double calculate(int price) {
    return price * 0.125 + (price * 0.125 + price) * 0.02;
  }
}

class Imported extends Type {
  double calculate(int price) {
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
