import 'package:dmsg/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../models/chat.dart';

class ChatListItem extends GetWidget {
  final Chat chat;
  ChatListItem({required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfilePicture(url: null,),
      title: Text(chat.participants[0].username),
      subtitle: Text("text"),
    );
  }
}