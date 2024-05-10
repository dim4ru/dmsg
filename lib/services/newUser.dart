import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import '../constants.dart';

Future<void> addUser(String uid) async {
  // URL запроса для добавления нового пользователя
  final addUserUrl = '$databaseUrl/users.json';

  // Создаем новый пользовательский объект
  final newUser = {
    'uid': uid,
    'username': "user${Random().nextInt(9999) + 1000}",
    'avatar': null,
  };

  // Кодируем объект пользователя в формат JSON
  final newUserJson = json.encode(newUser);

  // Создаем POST-запрос для добавления нового пользователя
  final response = await http.post(
    Uri.parse(addUserUrl),
    body: newUserJson,
  );

  // Проверяем, был ли запрос успешным
  if (response.statusCode == 200) {
    print('Новый пользователь успешно добавлен.');
  } else {
    print('Не удалось добавить нового пользователя.');
  }
}