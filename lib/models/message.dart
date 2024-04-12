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

class TextMessage extends Message {
  final String text;

  TextMessage(int messageId, int senderId, int receiverId, DateTime timestamp, this.text) : super(messageId: messageId, senderId: senderId, receiverId: receiverId, timestamp: timestamp);
}

class ImageMessage extends Message {
  final String imageUrl;

  ImageMessage(int messageId, int senderId, int receiverId, DateTime timestamp, this.imageUrl) : super(messageId: messageId, senderId: senderId, receiverId: receiverId, timestamp: timestamp);
}