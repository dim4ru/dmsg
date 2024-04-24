import 'package:dmsg/services/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SignInController {
  final email = RxString("");
  final password = RxString("");
}

class SignIn extends GetView<SignInController> {
  final controller = SignInController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Signing In"),
        actions: [
          TextButton(onPressed: () {
            Get.to(() => SignUp());
          }, child: Text("Not signed up yet?"))
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 200),
          width: 500,
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (val) {
                    controller.email.value = val;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field cannot be blank';
                    }
                    if (!value.isEmail) {
                      return 'Incorrect email format';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  onChanged: (val) {
                    controller.password.value = val;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field cannot be blank';
                    }
                    if (value.length <6) {
                      return "Password should be at least 6 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: () async {
                  if (true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Incorrect email or password')),
                    );
                  }
                }, child: const Text("Sign in"))
              ],
            ),
          ),
        ),
      ),
    );
  }

}