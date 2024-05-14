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

    //TODO dev only
    Message message = chatController.messages.value[0];

    return Obx(() => (chatsController.targetChat.value == null)
        ? Text("Select chat")
        : Column(
            children: [
              ChatHeader(
                image: null,
                name: "Ivan Ivanov Test",
              ),

              //TODO dev only
              (message is model.TextMessage)
                  ? IncomingTextMessage(
                      message: model.TextMessage(
                      messageId: message.messageId,
                      senderId: message.senderId,
                      receiverId: message.receiverId,
                      timestamp: message.timestamp,
                      text: message.text,
                    ))
                  : const Text("Couldn't display the message"),
              // SizedBox(
              //   height: 300,
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: chatController.messages.value.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       Message message = chatController.messages.value[index];
              //
              //       if (message is model.TextMessage) {
              //         return IncomingTextMessage(message: model.TextMessage(messageId: message.messageId, senderId: message.senderId, receiverId: message.receiverId, timestamp: message.timestamp, text: message.text, ));
              //       } else if (message is model.ImageMessage) {
              //         return IncomingImageMessage(message: model.ImageMessage(messageId: message.messageId, senderId: message.senderId, receiverId: message.receiverId, timestamp: message.timestamp, imageUrl: message.imageUrl));
              //       } else {
              //         return const Text("Couldn't display the message");
              //       }
              //     },
              //   ),
              // )
            ],
          ));
  }
}
