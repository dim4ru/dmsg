// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['userId'] as int,
      username: json['username'] as String,
      password: json['password'] as String,
      blockedUsers:
          (json['blockedUsers'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'password': instance.password,
      'blockedUsers': instance.blockedUsers,
    };
