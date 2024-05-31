import 'dart:convert';

import 'package:dmsg/models/chat.dart';
import 'package:dmsg/services/auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';
import 'helpers.dart';
import 'models/message.dart';
import 'models/user.dart';

class ChatsController extends GetxController {
  final chats = RxList<Chat>();
  final messages = RxList<Message>();
  final noChats = false.obs;

  final targetChat = Rx<Chat?>(null);
  final chatAvatar = RxnString(null);
  final chatTitle = RxString('');

  final currentUserUID = Get.find<AuthController>().user!.uid;
  final chatParticipant = Rx<User?>(null);
  final participatingIn = <int>[].obs;
  final _loading = false.obs;

  ChatsController() {
    _loading.value = true;
    getChats();
    _loading.value = false;
  }

  bool get loading => _loading.value;

  Future getChats() async {
    participatingIn.value = [1,2]; // TODO get chatIds from User profile
    print(participatingIn.value.length);

    for (int chatId in participatingIn.value) {
      if (chatId > 0){
        final url = Uri.https("dmsg-1d1c5-default-rtdb.europe-west1.firebasedatabase.app", "chats/${chatId-1}.json");
        final resp = await http.get(url);
        final Map<String, dynamic> responseData = json.decode(resp.body);
        chats.value.add(Chat.fromJson(responseData));
      }
    }
    // final url = Uri.https("dmsg-1d1c5-default-rtdb.europe-west1.firebasedatabase.app", "chats/${targetChat.value!.chatId-1}.json");
    // chats.value = chatsList.where((chat) => chat.participants.any((user) => user.uid == currentUserUID)).toList();
    // if(chats.value.isEmpty) noChats(true);
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

  Future getChatContent() async {
    if (targetChat.value != null) {
      // TODO в конструкторе не присваивается, потому что targetChat = null
      chatParticipant.value = getChatParticipant(targetChat.value!, currentUserUID);

      chatAvatar.value = getChatParticipant(targetChat.value!, currentUserUID).avatar;
      chatTitle.value = getChatName(targetChat.value!, currentUserUID);

      List<Message> messagesList = [];
      if (messagesList.isEmpty) {
        final resp = await http.get(Uri.parse(databaseUrl + '/chats.json?orderBy=%22chatId%22&equalTo=${targetChat.value!.chatId.toString()}'));
        final Map<String, dynamic> responseData = json.decode(resp.body);
        for (Map<String, dynamic> chatData in responseData.values) {
          for (Map<String, dynamic> messageData in chatData["messages"]) {
            if (messageData["imageUrl"] != null) {
              messagesList.add(ImageMessage.fromJson(messageData));
            } else {
              messagesList.add(TextMessage.fromJson(messageData));
            }
          }
        }
      }
      messages.value = messagesList;
    }
  }
}
