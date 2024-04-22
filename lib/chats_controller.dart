import 'dart:convert';

import 'package:dmsg/models/chat.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatsController extends GetxController {
  final chats = RxList<Chat>();

  DatabaseReference dbChatsRef = FirebaseDatabase.instance.ref().child('chats');

  ChatsController() {
    getAllChats();
  }

  void fetchData() {
    dbChatsRef.onValue.listen((event) {
      final data = event.snapshot.value;
    });
  }

  Future<void> getChatSnippet(int chatId) async {
    var ref = dbChatsRef.child((chatId-1).toString()).child('messages').orderByChild('timestamp').limitToLast(1);
    DatabaseEvent event = await ref.once();
    // print((((event.snapshot.value as List).last) as Map)['text']);
  }

  Future getAllChats() async {
    final url = Uri.https("dmsg-1d1c5-default-rtdb.europe-west1.firebasedatabase.app", "chats.json");
    final resp = await http.get(url);
    final List<dynamic> responseData = json.decode(resp.body);
    List<Chat> userList = responseData.map((userData) => Chat.fromJson(userData)).toList();
    chats.addAll(userList);
    chats.forEach((chat) {
      print(chat.messages[0].messageId);
    });
  }
}
