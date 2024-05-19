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

class Chat extends GetView<ChatsController> {
  final authController = Get.find<AuthController>();
  final chatsController = Get.find<ChatsController>();

  Chat({super.key});

  @override
  Widget build(BuildContext context) {


    return Obx(() {
      if (chatsController.targetChat.value == null){
        return const Center(child: Text("Select chat"),);
      } else if (chatsController.messages.value == null) {
        return const Center(child: CircularProgressIndicator(),);
      } else {
        List<Widget> messagesList = chatsController.messages.value.map((message) {
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
                    chatsController.chatTitle.value,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Expanded(
                  child: ListView(
                    children: messagesList.map((message) => message).toList(),
                  ),
                ),
                // MessageInput(),
              ],
            )
        );
      }
    });
  }
}
