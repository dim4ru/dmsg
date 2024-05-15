import 'package:dmsg/helpers.dart';
import 'package:dmsg/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/chat.dart';
import '../models/message.dart';
import '../services/auth.dart';

class ChatListItem extends GetWidget {
  final Chat chat;
  ChatListItem({required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfilePicture(url: null,),
      title: Text(getChatTitle(chat, Get.find<AuthController>().user!.uid)),
      //TODO сделать отображение имени, но не вызывая поиск appcontroller в каждом ListItem'е
      subtitle: Text(getChatSnippet(chat)),
      tileColor: Theme.of(context).colorScheme.secondary,
    );
  }

  String getChatSnippet(Chat chat) {
    Message lastMessage = chat.messages[0];
    print(lastMessage);
    //TODO не определяется тип сообщения
    if (lastMessage is TextMessage) {
      return lastMessage.text;
    } else if (lastMessage is ImageMessage) {
      return "Image";
    } else {
      return "Some message";
    }
  }

}