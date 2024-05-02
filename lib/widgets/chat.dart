import 'package:dmsg/chat_controller.dart';
import 'package:dmsg/widgets/chat_header.dart';
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
              ChatHeader(image: null, name: "Ivan Ivanov Test",),
            ],
          ));
  }
}
