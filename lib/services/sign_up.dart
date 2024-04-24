import 'package:dmsg/services/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SignUpController {
  final username = RxString("");
  final password = RxString("");
}

class SignUp extends GetView<SignUpController> {
  final controller = SignUpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Signing Up"),
        actions: [
          TextButton(onPressed: () {
            Get.to(() => SignIn());
          }, child: Text("Already signed up?"))
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 200),
          width: 500,
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
                      const SnackBar(content: Text('You are already registered')),
                    );
                  }
                }, child: Text("Sign up"))
              ],
            ),
          ),
        ),
      ),
    );
  }

}