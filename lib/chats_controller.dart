import 'package:dmsg/models/chat.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';


class ChatsController extends GetxController {
  final chats = RxList<Chat>();

  DatabaseReference dbChatsRef = FirebaseDatabase.instance.ref().child('chats');

  ChatsController() {
    getChatSnippet(2);
  }

  void fetchData() {
    dbChatsRef.onValue.listen((event) {
      final data = event.snapshot.value;
      print(data);
    });
  }

  Future<void> getChatSnippet(int chatId) async {
    var ref = dbChatsRef.child((chatId-1).toString()).child('messages').orderByChild('timestamp').limitToLast(1);
    DatabaseEvent event = await ref.once();
    print((((event.snapshot.value as List).last) as Map)['text']);
  }
}
