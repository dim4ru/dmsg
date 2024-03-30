import 'package:dmsg/models/user.dart';
import 'message.dart';

class Chat {
  final int chatId;
  final List<Message> messages;
  final List<User> participants;

  Chat(
    this.chatId,
    this.messages,
    this.participants,
  );

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      json['chatId'] ?? 0,
      (json['messages'] as List<dynamic>).map((messageJson) => Message.fromJson(messageJson)).toList(),
      (json['participants'] as List<dynamic>).map((userJson) => User.fromJson(userJson)).toList(),
    );
  }
}
