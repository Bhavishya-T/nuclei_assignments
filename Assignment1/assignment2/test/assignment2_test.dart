import 'package:assignment2/assignment2.dart';
import 'package:assignment2/utilities.dart' as util;
import 'package:test/test.dart';

void main() {
  group("Testing addUser() ", () {
    group("nameHandler()", () {
      test("Name with a number", () {
        expect(() => util.nameHandler("Bhavishya2"), throwsException);
      });
      test("Empty field", () {
        expect(() => util.nameHandler(""), throwsException);
      });
      test("Correct name", () {
        expect(() => util.nameHandler("Bhavishya"), returnsNormally);
      });
    });
    group("ensurePositive()", () {
      test("Negative number", () {
        expect(() => util.ensurePositive(-10), throwsException);
      });
      test("Positive number", () {
        expect(() => util.ensurePositive(10), returnsNormally);
      });
    });
    group("acceptCourses()", () {
      test("Wrong list", () {
        expect(() => util.acceptCourses("A B F"), throwsException);
      });
      test("Valid list", () {
        expect(() => util.acceptCourses("A B C D"), returnsNormally);
      });
    });
  });
  group("Testing displayUser() ", () {
    test("Invalid sorting order", () {
      expect(() => util.displayMap("f", 2), throwsException);
    });
    test("Valid sorting order", () {
      expect(() => util.displayMap("d", 2), returnsNormally);
    });
    test("Invalid option", () {
      expect(() => util.displayMap("f", 5), throwsException);
    });
  });
  group("Testing deleteUser() ", () {
    test("Roll Number not present in database", () {
      expect(() => util.checkRollNumber(100), throwsException);
    });
    test("Roll Number present in database", () {
      expect(() => util.checkRollNumber(1), returnsNormally);
    });
  });
}
