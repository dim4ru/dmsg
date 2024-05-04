import 'dart:convert';

import 'package:dmsg/models/chat.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatsController extends GetxController {
  final chats = RxList<Chat>();
  final Rx<int?> targetChat = Rx<int?>(null);

  ChatsController() {
    getChats();
  }

  Future getChats() async {
    final url = Uri.https("dmsg-1d1c5-default-rtdb.europe-west1.firebasedatabase.app", "chats.json");
    final resp = await http.get(url);
    final List<dynamic> responseData = json.decode(resp.body);
    List<Chat> chatsList = responseData.map((userData) => Chat.fromJson(userData)).toList();
    print(chatsList.toString());
    chats.value = chatsList;
  }
}
