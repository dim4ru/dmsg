// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      messageId: json['messageId'] as int,
      senderId: json['senderId'] as int,
      receiverId: json['receiverId'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'messageId': instance.messageId,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'timestamp': instance.timestamp.toIso8601String(),
    };
