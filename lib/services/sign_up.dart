import 'package:dmsg/services/sign_in.dart';
import 'package:dmsg/models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SignUpController {
  final email = RxString("");
  final password = RxString("");

  Future signUp() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email.value, password: password.value);
      User user = result.user!;
      return userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  model.User? userFromFirebaseUser(User? user) {
    return user != null ? model.User(uid: user.uid, username: 'newuser') : null;
  }
}

class SignUp extends GetView<SignUpController> {
  final _formKey = GlobalKey<FormState>();
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
                SizedBox(height: 20,),
                ElevatedButton(onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    controller.signUp();
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