import 'package:dmsg/models/user.dart' as model;
import 'package:dmsg/services/newUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AuthController extends GetxController {
  final email = RxString("");
  final password = RxString("");
  final _user = Rxn<User?>();
  final _loading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((User? user) {
      _loading.value = true;
      _user.value = user;
      _loading.value = false;
    });
  }

  User? get user => _user.value;
  bool get loading => _loading.value;

  model.User? _userFromFirebaseUser(User? user) {
    return user != null ? model.User(uid: user.uid, username: 'newuser') : null;
  }

  Future<dynamic> signUp() async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email.value, password: password.value);
      User user = result.user!;
      print("UID FOR REG " + user.uid);
      addUser(user.uid);
      return _userFromFirebaseUser(user);
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
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email.value, password: password.value);
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      return e.toString();
    }
  }
}