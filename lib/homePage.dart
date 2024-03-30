import 'package:dmsg/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  final usersController = UsersController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Chats"),
      ),
      body: Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: usersController.users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(usersController.users.value[index]),
                );
              },
            ),
          ),
          const FlutterLogo(),
        ],
      ),
      ),
    );
  }

}