import 'package:dmsg/chat_controller.dart';
import 'package:dmsg/widgets/chat_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:dmsg/widgets/message.dart';

import '../chats_controller.dart';
import '../models/message.dart' as model;
import '../models/message.dart';

class Chat extends GetView<ChatController> {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    final chatsController = Get.find<ChatsController>();
    final chatController = Get.find<ChatController>();

    return Obx(() => (chatsController.displayChat.value == null)
        ? Text("Select chat")
        : Column(
            children: [
              ChatHeader(
                image: null,
                name: "Ivan Ivanov Test",
              ),
              IncomingMessage(
                  message: model.TextMessage(
                    messageId: 1,
                    senderId: 2,
                    receiverId: 3,
                    timestamp: DateTime.now(),
                    text: 'Wassup?',
                  )
              ),
              OutcomingMessage(
                  message: model.TextMessage(
                    messageId: 1,
                    senderId: 2,
                    receiverId: 3,
                    timestamp: DateTime.now(),
                    text: 'Fine...',
                  )
              )
            ],
          ));
  }
}
