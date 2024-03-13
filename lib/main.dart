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
    final users = RxList<String>();
    DatabaseReference _testRef = FirebaseDatabase.instance.reference().child('users');

    _testRef.onValue.listen((event) {
      final data = event.snapshot.value;
      final userList = (data as Map<String, dynamic>).values.cast<String>().toList(); // Преобразование данных в список имен
      users.value = userList; // Обновляем RxList пользователей

      // Для примера выводим список имен пользователей
    });
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
        body: Obx(() => Column(
          children: users.map((user) => Text(user)).toList(),
        ))
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: <Widget>[
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: users.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             title: Text(users[index]),
      //           );
      //         },
      //       ),
      //     ),
      //     const FlutterLogo(),
      //   ],
      // ),
      // FutureBuilder(
      //   future: _fApp,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return Text("Error");
      //     } else if (snapshot.hasData) {
      //       return Text("Firebase initialized");
      //     } else {
      //       return CircularProgressIndicator();
      //     }
      //   },
      // )
    );
  }
}
