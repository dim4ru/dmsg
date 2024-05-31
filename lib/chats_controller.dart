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
  final currentUser = Rx<User?>(null);
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
    final url = Uri.parse('https://dmsg-1d1c5-default-rtdb.europe-west1.firebasedatabase.app/users.json?orderBy=%22uid%22&equalTo=%22jktIhqbjBcUU3Ys4GOgtDASOSPx2%22');
    final resp = await http.get(url);
    final Map<String, dynamic> responseData = json.decode(resp.body);
    final userData = responseData.values.first;
    final user = User.fromJson(userData);
    currentUser.value = user;

    participatingIn.value = (currentUser.value!.participatingIn!.keys
            .toList()
            .map((key) => key.substring(1, key.length - 1)))
        .map(int.parse)
        .toList();
      participatingIn.value.forEach((value) async {
        final url = Uri.https("dmsg-1d1c5-default-rtdb.europe-west1.firebasedatabase.app", "chats/${value-1}.json");
        final resp = await http.get(url);
        final Map<String, dynamic> responseData = json.decode(resp.body);
        chats.value.add(Chat.fromJson(responseData));
      });
  }

  Future getChatContent() async {
    if (targetChat.value != null) {
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
