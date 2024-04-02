import 'dart:core';

class User {
  int userId;
  String username;
  String password;
  List<int> blockedUsers;

  User({required this.userId, required this.username, required this.password, required this.blockedUsers});

  factory User.fromJson(Map<String, dynamic> userJson) {
    return User(
      userId: userJson['userId'],
      username: userJson['username'],
      password: userJson['password'],
      blockedUsers: userJson['blockedUsers'] != null ? List<int>.from(userJson['blockedUsers']) : [],
    );
  }
}
