import 'dart:convert';

import 'package:get/get.dart';

import 'constants.dart';
import 'models/chat.dart';
import 'models/message.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  final chatName = RxnString(null);
  final messages = RxList<Message>();

  ChatController(Chat targetChat) {
    getMessages(targetChat.chatId);
  }

  Future getMessages(int chatId) async {
    final resp = await http.get(Uri.parse(databaseUrl + '/chats.json?orderBy=%22chatId%22&equalTo=${chatId.toString()}'));
    final Map<String, dynamic> responseData = json.decode(resp.body);
    for (Map<String, dynamic> chatData in responseData.values) {
      for (Map<String, dynamic> messageData in chatData["messages"]) {
        if (messageData["imageUrl"] != null) {
          messages.add(ImageMessage.fromJson(messageData));
        } else {
          messages.add(TextMessage.fromJson(messageData));
        }
      }
    }
  }
}