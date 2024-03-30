import 'dart:core';

class User {
  final int userId;
  final String username;
  final String password;
  List<int> blockedUsers;

  User(this.userId, this.username, this.password, this.blockedUsers);

  factory User.fromJson(Map<String, dynamic> userJson) {
    return User(
      userJson['userId'],
      userJson['username'],
      userJson['password'],
      userJson['blockedUsers'] != null ? List<int>.from(userJson['blockedUsers']) : [],
    );
  }
}
