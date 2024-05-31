import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String uid;
  String? avatar;
  String username;
  Map<dynamic, dynamic>? participatingIn;

  User({required this.uid, this.avatar,required this.username, this.participatingIn});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
