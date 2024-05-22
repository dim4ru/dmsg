import 'dart:convert';

import 'package:dmsg/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import '../chats_controller.dart';
import '../models/user.dart';

class MessageInputController extends GetxController {
  final chatsController = Get.find<ChatsController>();

  final text = RxString('');
  final from = Rxn<User?>(null);
  final to = Rxn<User?>(null);

  MessageInputController();

  // Future addMessage() async {
  //   final sendMessageUrl = '$databaseUrl/chats.json';
  //
  //   from.value = chatsController.targetChat.value!.participants.firstWhere((user) => user != chatsController.chatParticipant);
  //   to.value = chatsController.chatParticipant.value!;
  //
  //   final newMessage = {
  //     'receiverId': to,
  //     'senderId': from,
  //     'text': text.value,
  //     'timestamp': DateTime.now()
  //   };
  //
  //   final response = await http.post(
  //     Uri.parse(sendMessageUrl),
  //     body: json.encode(newMessage)
  //   );
  //
  //   if (response.statusCode == 200) {
  //     print("Message was sent successfully (body: $newMessage)");
  //   } else {
  //     print("Couldn't send message (body: $newMessage)");
  //   }
  // }

  Future addMessage() async {
    final sendMessageUrl = '$databaseUrl/chats/${chatsController.targetChat.value!.chatId - 1}/messages.json';

    from.value = chatsController.targetChat.value!.participants.firstWhere((user) => user.uid == chatsController.currentUserUID);
    to.value = chatsController.chatParticipant.value!;

    final newMessage = {
      'messageId': DateTime.now().millisecondsSinceEpoch, // Уникальный ID сообщения
      'receiverId': to.value!.uid,
      'senderId': from.value!.uid,
      'text': text.value,
      'timestamp': DateTime.now().toIso8601String()
    };

    // Обновляем данные чата на сервере
    final response = await http.post(
      Uri.parse(sendMessageUrl),
      body: json.encode(newMessage),
    );

    if (response.statusCode == 200) {
      print("Message was sent successfully (body: $newMessage)");
    } else {
      print("Couldn't send message (body: $newMessage)");
    }
  }
}