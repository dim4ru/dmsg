import 'dart:core';

class User {
  final int userId;
  final String username;
  final String password;
  final List<int> blockedUsers;

  User(this.userId, this.username, this.password, this.blockedUsers);
}