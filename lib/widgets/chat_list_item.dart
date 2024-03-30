import 'package:dmsg/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ChatListItem extends GetWidget {
  final String name;
  final String image;
  final String messageSnippet ;

  ChatListItem({required this.name, required this.image, required this.messageSnippet});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfilePicture(url: image,),
      title: Text(name),
      subtitle: Text(messageSnippet),
    );
  }
}