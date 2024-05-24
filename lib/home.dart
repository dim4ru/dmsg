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
          // title: Text(auth.user != null ? auth.user!.uid : "null uid error"),
          title: Text("DMSG – Free Messanger"),
          actions: [
            // IconButton(onPressed: (){}, icon: const Icon(Icons.add_comment_outlined), tooltip: "Find user & write message",),
            TextButton(
                onPressed: () async {
                  Get.to(() => SignIn());
                  dynamic result = await auth.signOut();
                  if (result is String) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(result),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('You have signed out successfully')),
                    );
                    Get.deleteAll(force: true);
                  }
                },
                child: Text("Sign out"))
          ],
        ),
        body: Obx(() => SafeArea(
              top: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ChatsList(),
                  const VerticalDivider(
                    width: 1,
                  ),
                  auth.user == null
                      ? Center(child: CircularProgressIndicator())
                      : Chat(),
                ],
              ),
            )
        )
    );
  }
}
