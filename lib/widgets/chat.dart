import 'package:dmsg/chat_controller.dart';
import 'package:dmsg/widgets/chat_header.dart';
import 'package:dmsg/widgets/messages/image_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:dmsg/widgets/messages/text_message.dart';

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
              IncomingTextMessage(
                  message: model.TextMessage(
                    messageId: 1,
                    senderId: 2,
                    receiverId: 3,
                    timestamp: DateTime.now(),
                    text: """
                    Wassup?Wassup?Wassup?Wassup?Wassup?Wassup?
                    """,
                  )
              ),
              OutcomingTextMessage(
                  message: model.TextMessage(
                    messageId: 1,
                    senderId: 2,
                    receiverId: 3,
                    timestamp: DateTime.now(),
                    text: 'Fine...',
                  )
              ),
              IncomingImageMessage(
                  message: model.ImageMessage(
                    messageId: 1,
                    senderId: 2,
                    receiverId: 3,
                    timestamp: DateTime.now(),
                    imageUrl: 'https://images.unsplash.com/photo-1612528443702-f6741f70a049?q=80&w=3880&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                )
              ),
              OutcomingImageMessage(
                  message: model.ImageMessage(
                    messageId: 1,
                    senderId: 2,
                    receiverId: 3,
                    timestamp: DateTime.now(),
                    imageUrl: 'https://images.unsplash.com/photo-1566633806327-68e152aaf26d?q=80&w=3870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  )
              )
            ],
          ));
  }
}
