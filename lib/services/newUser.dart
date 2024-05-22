import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import '../constants.dart';

Future<void> addUser(String uid) async {
  final addUserUrl = '$databaseUrl/users.json';

  final newUser = {
    'uid': uid,
    'username': "user${Random().nextInt(9999) + 1000}",
    'avatar': null,
  };

  final newUserJson = json.encode(newUser);

  final response = await http.post(
    Uri.parse(addUserUrl),
    body: newUserJson,
  );

  if (response.statusCode == 200) {
    print('New user added (uid: $uid)');
  } else {
    print("Cooldn't add new user (uid: $uid");
  }
}