import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  final users = RxList<String>();

  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('users');

  UsersController() {
    getAllUsers();
  }

  void getAllUsers() {
    dbRef.onValue.listen((event) {
      final data = event.snapshot.value;
      final userList = (data as List<dynamic>).map((user) => user['name'] as String).toList();
      users.value = userList;
    });
  }
}