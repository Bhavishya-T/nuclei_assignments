import 'package:assignment2/utilities.dart';
import 'package:assignment2/map_utils.dart' as map_utils;
import 'package:test/test.dart';

void main() {
  group("Testing addUser() ", () {
    group("nameHandler()", () {
      test("Name with a number", () {
        expect(() => Validators.nameValidator("Bhavishya2"), throwsException);
      });
      test("Empty field", () {
        expect(() => Validators.nameValidator(""), throwsException);
      });
      test("Correct name", () {
        expect(() => Validators.nameValidator("Bhavishya"), returnsNormally);
      });
    });
    group("ensurePositive()", () {
      test("Negative number", () {
        expect(() => Validators.ensurePositive(-10), throwsException);
      });
      test("Positive number", () {
        expect(() => Validators.ensurePositive(10), returnsNormally);
      });
    });
    group("acceptCourses()", () {
      test("Wrong list", () {
        expect(() => Validators.acceptCourses("A B F"), throwsException);
      });
      test("Valid list", () {
        expect(() => Validators.acceptCourses("A B C D"), returnsNormally);
      });
    });
  });
  group("Testing displayUser() ", () {
    test("Invalid sorting order", () {
      expect(() => map_utils.MapUtils.displayMap("f", 2), throwsException);
    });
    test("Valid sorting order", () {
      expect(() => map_utils.MapUtils.displayMap("d", 2), returnsNormally);
    });
    test("Invalid option", () {
      expect(() => map_utils.MapUtils.displayMap("f", 5), throwsException);
    });
  });
  group("Testing deleteUser() ", () {
    test("Roll Number not present in database", () {
      expect(() => Validators.checkRollNumber(100), throwsException);
    });
    test("Roll Number present in database", () {
      expect(() => Validators.checkRollNumber(1), returnsNormally);
    });
  });
}
