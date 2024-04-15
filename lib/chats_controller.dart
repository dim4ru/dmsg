import 'package:dmsg/models/chat.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';


class ChatsController extends GetxController {
  final chats = RxList<Chat>();

  DatabaseReference dbChatsRef = FirebaseDatabase.instance.ref().child('chats/0/participants/0/username');

  ChatsController() {
    fetchData();
  }

  void fetchData() {
    dbChatsRef.onValue.listen((event) {
      final data = event.snapshot.value;
      print(data);
    });
  }
}
