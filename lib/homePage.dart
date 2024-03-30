import 'package:dmsg/widgets/chat_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'chats_controller.dart';

class HomePage extends GetView {
  final chatsController = ChatsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Chats"),
      ),
      body: Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 250,
            color: Colors.red,
            child: ListView.builder(
              itemCount: chatsController.chats.length,
              itemBuilder: (context, index) {
                return ChatListItem(name: chatsController.chats[index].chatId.toString(), image: "https://avatars.dzeninfra.ru/get-zen_doc/3822405/pub_61d5e240f443461eefd97f13_61d5e2e5031d8c08bbe63beb/scale_1200", messageSnippet: "привет");
              },
            ),
          ),
          VerticalDivider(),
          Text("Lorem ipsum dolor sit amet"),
        ],
      )),
    );
  }
}