import 'package:dmsg/chats_controller.dart';
import 'package:dmsg/helpers.dart';
import 'package:dmsg/widgets/chat_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../models/chat.dart';

class ChatsList extends GetView<ChatsController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatsController>();
    return Obx(
      () => controller.noChats.value
          ? Center(child: const Text("You have no chats yet"))
          : controller.chats.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.chats.length,
                    itemBuilder: (BuildContext context, int index) {
                      Chat chat = controller.chats[index];
                      String currentUserUID = controller.auth.user!.uid;
                      return GestureDetector(
                        onTap: () => controller.targetChat.value =
                            controller.chats[index],
                        child: ChatListItem(
                            profileUrl: getChatParticipant(chat, currentUserUID).avatar,
                            chatName: getChatName(chat, currentUserUID),
                            chatSnippet: controller.getChatSnippet(chat),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
