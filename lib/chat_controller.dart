import 'package:get/get.dart';

import 'models/message.dart';

class ChatController extends GetxController {
  final messages = RxList<Message>();
  final messagesCount = RxInt(0);

  ChatController();
}