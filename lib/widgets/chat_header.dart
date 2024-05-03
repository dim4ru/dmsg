import 'package:dmsg/widgets/profile_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ChatHeader extends GetWidget {
  final String? image;
  final String? name;

  ChatHeader({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.secondary,
        height: 50,
        child: Row(
          children: [
            Row(
              children: [
                ProfilePicture(url: image),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  name ?? "",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline))
          ],
        ));
  }
}
