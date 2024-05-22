import 'dart:convert';

import 'package:dmsg/constants.dart';
import 'package:dmsg/models/message.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import 'chats_controller.dart';
import 'models/user.dart';

class MessageInputController extends GetxController {
  final chatsController = Get.find<ChatsController>();

  final text = RxString('');
  final from = Rxn<User?>(null);
  final to = Rxn<User?>(null);

  MessageInputController();

  Future addMessage() async {
    final sendMessageUrl = '$databaseUrl/chats/${chatsController.targetChat.value!.chatId - 1}/messages.json';

    from.value = chatsController.targetChat.value!.participants.firstWhere((user) => user.uid == chatsController.currentUserUID);
    to.value = chatsController.chatParticipant.value!;

    chatsController.messages.value.add(TextMessage(messageId: DateTime.now().millisecondsSinceEpoch, senderId: from.value!.uid, receiverId: to.value!.uid, timestamp: DateTime.now(), text: text.value),);

    final response = await http.put(
      Uri.parse(sendMessageUrl),
      body: json.encode(chatsController.messages),
    );

    if (response.statusCode == 200) {
      print("Message was sent successfully (body: )");
    } else {
      print("Couldn't send message (body: )");
    }
  }
}