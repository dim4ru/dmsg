import 'models/chat.dart';
import 'models/user.dart';

String getChatName(Chat chat, String currentUserUID) {
  var participants = chat.participants
      .where((element) => element.uid != currentUserUID)
      .toList();
  return participants.map((e) => e.username).join(", ");
}

User getChatParticipant(Chat chat, String currentUserUID) {
  var participants = chat.participants
      .where((element) => element.uid != currentUserUID)
      .toList();
  //TODO Берется первый участник чата, что не подходит для групповых чатов
  return participants[0];
}