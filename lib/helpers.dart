import 'models/chat.dart';

String getChatTitle(Chat chat, String currentUserUID) {
  var result = chat.participants
  //TODO DEV ONLY user2732
      .where((element) => element.uid != currentUserUID)
      .toList();
  return result.map((e) => e.username).join(", ");
}