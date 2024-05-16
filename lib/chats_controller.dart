import 'dart:convert';

import 'package:dmsg/models/chat.dart';
import 'package:dmsg/services/auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'models/message.dart';

class ChatsController extends GetxController {
  final chats = RxList<Chat>();
  final noChats = false.obs;
  final targetChat = Rx<Chat?>(null);
  final auth = Get.find<AuthController>();
  final _loading = false.obs;

  ChatsController() {
    _loading.value = true;
    getChats();
    _loading.value = false;
  }

  bool get loading => _loading.value;

  Future getChats() async {
    final url = Uri.https("dmsg-1d1c5-default-rtdb.europe-west1.firebasedatabase.app", "chats.json");
    final resp = await http.get(url);
    final List<dynamic> responseData = json.decode(resp.body);
    List<Chat> chatsList = responseData.map((userData) => Chat.fromJson(userData)).toList();
    chats.value = chatsList.where((chat) => chat.participants.any((user) => user.uid == auth.user?.uid)).toList();
    if(chats.value.isEmpty) noChats(true);
  }

  String getChatSnippet(Chat chat) {
    Message lastMessage = chat.messages[0];
    if (lastMessage is TextMessage) {
      return lastMessage.text;
    } else if (lastMessage is ImageMessage) {
      return "Image";
    } else {
      return "Some message";
    }
  }
}
