import 'package:cached_network_image/cached_network_image.dart';
import 'package:dmsg/direction.dart';
import 'package:dmsg/widgets/messages/image_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:dmsg/widgets/messages/text_message.dart';
import 'package:octo_image/octo_image.dart';
import 'package:firebase_database/firebase_database.dart';

import '../chats_controller.dart';
import '../constants.dart';
import '../models/message.dart' as model;
import 'message_input.dart';

class Chat extends GetView<ChatsController> {
  final chatsController = Get.find<ChatsController>();

  Chat({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('chats');
    dbRef.onValue.listen((event) {
      chatsController.getChatContent();
    });

    return Obx(() {
      if (chatsController.targetChat.value == null){
        return const Center(child: Text("Select chat"),);
      } else if (chatsController.messages.value.isEmpty) {
        return const Center(child: CircularProgressIndicator(),);
      } else {
        List<Widget> messagesList = chatsController.messages.value.map((message) {
          if (message is model.TextMessage) {
            if (getDirection(message, chatsController.currentUserUID) == Direction.outgoing) {
              return OutgoingTextMessage(message: message);
            }
            return IncomingTextMessage(message: message);

          } else if (message is model.ImageMessage) {
            if (getDirection(message, chatsController.currentUserUID) == Direction.outgoing) {
              return OutgoingImageMessage(message: message);
            }
            return IncomingImageMessage(message: message);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Some messages can't be displayed because an error occured"),
              ),
            );
            throw Exception("Unknown message type: ${message.runtimeType}");
          }
        }).toList();
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(messageBubbleChatMargin),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: (chatsController.chatAvatar.value == null ||
                                  chatsController.chatAvatar.value == "")
                              ? null
                              : OctoImage(
                                  image: CachedNetworkImageProvider(
                                      chatsController.chatAvatar.value!),
                                  placeholderBuilder: OctoPlaceholder
                                      .circularProgressIndicator(),
                                  errorBuilder:
                                      OctoError.icon(color: Colors.black),
                                ),
                        ),
                      ),
                      SizedBox(width: 13,),
                    Text(
                      chatsController.chatTitle.value,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                )
              ),
              const Divider(
                height: 1,
              ),
              Expanded(
                child: ListView(
                  reverse: true,
                  children: [
                    SizedBox(height: messageBubbleChatMargin), // Add this line
                    ...messagesList.map((message) => message).toList().reversed.toList(), // Replace ... with your actual list items
                  ],
                ),
              ),
              if (chatsController.loading == false) MessageInput(),
            ],
          ),
        );
      }
    });
  }
}
