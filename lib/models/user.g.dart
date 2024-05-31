// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String,
      avatar: json['avatar'] as String?,
      username: json['username'] as String,
      participatingIn: json['participatingIn'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'avatar': instance.avatar,
      'username': instance.username,
      'participatingIn': instance.participatingIn,
    };
