import 'package:dmsg/chats_controller.dart';
import 'package:dmsg/home.dart';
import 'package:dmsg/services/auth.dart';
import 'package:dmsg/services/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyC6q8fLmuYyo38HaLiNDjcB7KshbS1D0rc",
          appId: "1:226975447509:web:24ef0da7a7ca85c684255c",
          messagingSenderId: "226975447509",
          projectId: "dmsg-1d1c5",
          databaseURL:"https://dmsg-1d1c5-default-rtdb.europe-west1.firebasedatabase.app/")
  );
  Get.lazyPut(() => AuthController(), fenix: true);
  Get.lazyPut(() => ChatsController(), fenix: true);
  // Get.lazyPut(() => ChatController(), fenix: true);

  runApp(const MyApp());
}

class MyApp extends GetView {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chats - DMSG',
        theme: ThemeData.dark().copyWith(
            colorScheme: ThemeData.dark()
                .colorScheme
                .copyWith(primary: Color(0xff16E098), secondary: Color(0xff084E35))),
      home: Obx(() {
        if (Get.find<AuthController>().loading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Get.find<AuthController>().user == null
              ? SignIn()
              : Home();
        }
      }),
    );
  }
}
