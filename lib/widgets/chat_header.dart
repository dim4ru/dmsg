import 'package:dmsg/widgets/profile_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ChatHeader extends GetWidget {
  final String? image;
  final String? name;

  ChatHeader({required this.image, required this.name});

  final popupMenuItems = [
    PopupMenuItem(
      child: const Row(
        children: [
          Icon(Icons.delete_forever),
          SizedBox(width: 15,),
          Text('Clear chat'),
        ],
      ),
      onTap: () {},
    ),
    PopupMenuItem(
      child: const Row(
        children: [
          Icon(Icons.block),
          SizedBox(width: 15,),
          Text('Block user'),
        ],
      ),
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            ProfilePicture(url: image),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 15),
              child: Text(
                name ?? "",
                style: TextStyle(fontSize: 16),
              ),
            ),
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              tooltip: '',
              itemBuilder: (context) => popupMenuItems,
            )

          ],
        ),
      ],
    );
  }
}
