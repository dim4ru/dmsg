import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  int userId;
  String? avatar;
  String username;
  String password;

  User({required this.userId, this.avatar,required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
