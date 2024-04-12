import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  int userId;
  String username;
  String password;
  List<int> blockedUsers;

  User({required this.userId, required this.username, required this.password, required this.blockedUsers});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
