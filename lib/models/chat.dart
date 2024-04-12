import 'package:dmsg/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'message.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat {
  final int chatId;
  final List<Message> messages;
  final List<User> participants;

  Chat(
    this.chatId,
    this.messages,
    this.participants,
  );

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
