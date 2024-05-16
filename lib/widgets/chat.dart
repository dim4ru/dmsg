import 'package:dmsg/chat_controller.dart';
import 'package:dmsg/direction.dart';
import 'package:dmsg/services/auth.dart';
import 'package:dmsg/widgets/messages/image_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:dmsg/widgets/messages/text_message.dart';

import '../chats_controller.dart';
import '../models/message.dart' as model;
import 'message_input.dart';

class Chat extends GetView<ChatController> {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final chatsController = Get.find<ChatsController>();
    final ChatController? chatController = chatsController.targetChat.value != null ? ChatController(chatsController.targetChat.value!) : null;

    return Obx(() {
      if (chatsController.targetChat.value == null){
        return const Center(child: Text("Select chat"),);
      } else if (chatController == null) {
        return const Center(child: CircularProgressIndicator(),);
      } else {
        List<Widget> messages = chatController.messages.value.map((message) {
          if (message is model.TextMessage) {
            if (getDirection(message, authController.user!.uid) == Direction.outgoing) {
              return OutgoingTextMessage(message: message);
            }
            return IncomingTextMessage(message: message);

          } else if (message is model.ImageMessage) {
            if (getDirection(message, authController.user!.uid) == Direction.outgoing) {
              return OutgoingImageMessage(message: message);
            }
            return IncomingImageMessage(message: message);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Some messages can't be displayed because an error occured"),
              ),
            );
            throw Exception("Unknown message type: ${message.runtimeType}");
          }
        }).toList();
        return Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    chatController.title.value,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Expanded(
                  child: ListView(
                    children: messages.map((message) => message).toList(),
                  ),
                ),
                MessageInput(),
              ],
            )
        );
      }
    });
  }
}
