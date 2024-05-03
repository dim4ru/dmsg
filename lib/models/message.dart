import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  int messageId;
  int senderId;
  int receiverId;
  DateTime timestamp;

  Message({required this.messageId, required this.senderId, required this.receiverId, required this.timestamp});

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

// TODO make seiralizable
class TextMessage extends Message {
  final String text;

  TextMessage({required int messageId, required int senderId, required int receiverId, required DateTime timestamp, required this.text})
      : super(messageId: messageId, senderId: senderId, receiverId: receiverId, timestamp: timestamp);
}

// TODO update fields to requied
// TODO make seiralizable
class ImageMessage extends Message {
  final String imageUrl;

  ImageMessage(int messageId, int senderId, int receiverId, DateTime timestamp, this.imageUrl) : super(messageId: messageId, senderId: senderId, receiverId: receiverId, timestamp: timestamp);
}