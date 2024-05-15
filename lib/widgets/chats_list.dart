import 'package:dmsg/chats_controller.dart';
import 'package:dmsg/widgets/chat_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ChatsList extends GetView<ChatsController> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatsController>();
    return Obx(() => controller.chats.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.chats.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => controller.targetChat.value = controller.chats[index].chatId,
            child: ChatListItem(
              chat: controller.chats[index],
            ),
          );
        },
      ),
    ),
    );
  }
}