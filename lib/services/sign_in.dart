import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SignInController {
  final username = RxString("");
  final password = RxString("");
}

class SignIn extends GetView<SignInController> {
  final controller = SignInController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signing In"),
        actions: [
          TextButton(onPressed: () {}, child: Text("Not registred yet?"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 200, horizontal: 1000),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                keyboardType: TextInputType.text,
                onChanged: (val) {
                  controller.username.value = val;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be blank';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onChanged: (val) {
                  controller.password.value = val;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be blank';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () async {
                if (true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Incorrect username or password')),
                  );
                }
              }, child: Text("Sign in"))
            ],
          ),
        ),
      ),
    );
  }

}