import 'package:dmsg/services/auth.dart';
import 'package:dmsg/services/sign_in.dart';
import 'package:dmsg/widgets/chat_list_item.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'chats_controller.dart';

class Home extends GetView {
  final chatsController = ChatsController();
  final auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Chats"),
        actions: [
          TextButton(onPressed: () async {
            dynamic result = await auth.signOut();
            if (result is String) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(result),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('You have signed out successfully')),
              );
              Get.to(() => SignIn());
            }
          }, child: Text("Sign out"))
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 250,
            child: FirebaseAnimatedList(query: chatsController.dbChatsRef, itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
              Map chat = snapshot.value as Map;
              // chat['key'] = snapshot.key;
              return ChatListItem(name: chat['participants'][0]['username'], image: "", messageSnippet: chat['messages'][(chat['messages'] as List).length-1]['text'].toString());
            }),
          ),
          VerticalDivider(),
          Text("Welcome to DMSG"),
        ],
      ),
    );
  }
}