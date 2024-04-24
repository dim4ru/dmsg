import 'package:dmsg/services/auth.dart';
import 'package:dmsg/services/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../home.dart';


class SignIn extends GetView<AuthController> {
  final _formKey = GlobalKey<FormState>();
  final controller = AuthController();

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
            key: _formKey,
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
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    dynamic result  = await controller.signIn();
                    if (result is String) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('You have signed in successfully')),
                      );
                      Get.to(() => Home());
                    }
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