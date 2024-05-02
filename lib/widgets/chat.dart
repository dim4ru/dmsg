import 'package:dmsg/chat_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../chats_controller.dart';

class Chat extends GetView<ChatController> {
  const Chat({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatsController>();
    return Obx(() => (controller.displayChat.value == null)
        ? Text("Select chat")
        : Column(
            children: [
              Container(
                  color: Theme.of(context).colorScheme.primary,
                  child: Row(
                    children: [Text(controller.displayChat.value!.toString())],
                  ))
            ],
          ));
  }
}
