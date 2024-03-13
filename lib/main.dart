import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chats - DMSG',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Chats'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final users = RxList<
        String>(); // Создаем RxList для хранения имен пользователей
    DatabaseReference _testRef = FirebaseDatabase.instance.reference().child(
        'users');

    _testRef.onValue.listen((event) {
      final data = event.snapshot.value;
      final userList = (data as List<dynamic>).map((
          user) => user['name'] as String).toList();
      users.value = userList; // Обновляем RxList пользователей

      // Для примера выводим список имен пользователей
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index]),
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
