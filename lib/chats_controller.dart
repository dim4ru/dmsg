import 'package:dmsg/models/chat.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';


class ChatsController extends GetxController {
  final chats = RxList<Chat>();

  DatabaseReference dbChatsRef = FirebaseDatabase.instance.ref().child('chats');

  ChatsController() {
    fetchData();
  }

  void fetchData() {
    dbChatsRef.onValue.listen((event) {
      final data = event.snapshot.value;
      print("DATA: ${data}");
      if (data != null && data is Map) {
        // Преобразуем полученные данные в список чатов
        List<Chat> chatList = [];
        data.forEach((key, value) {
          chatList.add(Chat.fromJson(value));
        });
        // Устанавливаем значение для переменной chats
        chats.value = chatList;
      }
    });
    print("CHATS: ${chats.value}");
  }
}
