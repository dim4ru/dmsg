import 'dart:convert';

import 'package:get/get.dart';

import 'constants.dart';
import 'models/message.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  final messages = RxList<Message>();
  final messagesCount = RxInt(0);
  final Rx<int?> targetChat = Rx<int?>(null);

  ChatController() {
  }

  Future getMessages(int chatId) async {
    final resp = await http.get(Uri.parse(databaseUrl + '/chats.json?orderBy=%22chatId%22&equalTo=1'));
    final List<dynamic> responseData = json.decode(resp.body);
  }

  /*
  Future<List<Message>> getMessages() async {
    final resp = await http.get(Uri.parse(databaseUrl + '/chats.json?orderBy=%22chatId%22&equalTo=1'));
    final List<dynamic> responseData = json.decode(resp.body);

    List<Message> messagesList = [];
    for (Map<String, dynamic> chatData in responseData) {
        for (Map<String, dynamic> messageData in chatData["messages"]) {
            if (messageData["imageUrl"] != null) {
                messagesList.add(ImageMessage.fromJson(messageData));
            } else {
                messagesList.add(TextMessage.fromJson(messageData));
            }
        }
    }

    return messagesList;
}

   */
}