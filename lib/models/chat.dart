import 'package:dmsg/models/user.dart';

import 'message.dart';

class Chat {
  final int chatId;
  final List<Message> messages;
  final List<User> participants;

  Chat(this.chatId, this.messages, this.participants);
}