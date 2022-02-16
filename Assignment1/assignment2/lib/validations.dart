import 'dart:core';

class InvalidRollNumber implements Exception {
  String cause;
  InvalidRollNumber(this.cause);

  String toString() {
    return cause;
  }
}

class InvalidName implements Exception {
  String cause;
  InvalidName(this.cause);

  String toString() {
    return cause;
  }
}

class InvalidCourseException implements Exception {
  String cause;
  InvalidCourseException(this.cause);

  String toString() {
    return cause;
  }
}
