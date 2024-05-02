import 'package:dmsg/services/auth.dart';
import 'package:dmsg/services/sign_in.dart';
import 'package:dmsg/widgets/chat.dart';
import 'package:dmsg/widgets/chats_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Home extends GetView {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ChatsList(),
          VerticalDivider(),
          Obx(
                () => Get.find<AuthController>().user == null
                ? Text('Не авторизован')
                : Chat(),
          ),
        ],
      ),

    );
  }
}