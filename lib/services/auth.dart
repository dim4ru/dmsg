import 'package:dmsg/models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AuthController extends GetxController {
  final email = RxString("");
  final password = RxString("");

  final FirebaseAuth auth = FirebaseAuth.instance;

  model.User? userFromFirebaseUser(User? user) {
    return user != null ? model.User(uid: user.uid, username: 'newuser') : null;
  }

  Future<dynamic> signUp() async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email.value, password: password.value);
      User user = result.user!;
      return userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'The provided email is already in use by an existing user';
      }
      return e.message!;
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> signIn() async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(email: email.value, password: password.value);
      User user = result.user!;
      return userFromFirebaseUser(user);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> signOut() async {
    try {
      return await auth.signOut();
    } catch(e) {
      return e.toString();
    }
  }
}