class User {
  final String fullName, address;
  final int age, rollNumber;
  final List<String> courses;

  User(this.fullName, this.age, this.rollNumber, this.address, this.courses);

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'age': age.toString(),
      'rollNumber': rollNumber.toString(),
      'address': address,
      'courses': courses
    };
  }

  static User fromJson(Map data) {
    var userMap = data;
    var user = User(
        userMap['fullName'],
        int.parse(userMap['age']),
        int.parse(userMap['rollNumber']),
        userMap['address'],
        userMap['courses'].map<String>((value) => value as String).toList());
    return user;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
