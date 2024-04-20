import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'models/user.dart';

class UsersController extends GetxController {
  final users = RxList<User>();

  UsersController() {
    getAllUsers();
  }

  Future getAllUsers() async {
    final url = Uri.https("dmsg-1d1c5-default-rtdb.europe-west1.firebasedatabase.app", "users.json");
    final resp = await http.get(url);
    final List<dynamic> responseData = json.decode(resp.body);
    List<User> userList = responseData.map((userData) => User.fromJson(userData)).toList();
    users.addAll(userList);
  }
}