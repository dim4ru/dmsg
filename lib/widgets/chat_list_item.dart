import 'package:dmsg/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListItem extends GetWidget {
  final String? profileUrl;
  final String chatName;
  final String chatSnippet;

  ChatListItem({required this.profileUrl, required this.chatName, required this.chatSnippet});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfilePicture(url: profileUrl,),
      title: Text(chatName),
      // subtitle: Text(chatSnippet),
      tileColor: Theme.of(context).colorScheme.secondary,
    );
  }
}