import 'package:get/get.dart';

import '../chats_controller.dart';
import '../models/user.dart';

class MessageInputController extends GetxController {
  final chatsController = Get.find<ChatsController>();

  final text = RxString('');
  final from = Rxn<User?>(null);
  final to = Rxn<User?>(null);

  MessageInputController();

  Future sendMessage() async {
    from.value = chatsController.targetChat.value!.participants.firstWhere((user) => user != chatsController.chatParticipant);
    to.value = chatsController.chatParticipant.value!;

    final newMessage = {
      'receiverId': to,
      'senderId': from,
      'text': text.value,
      'timestamp': DateTime.now()
    };
  }
}