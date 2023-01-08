
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  static final _auth = FirebaseAuth.instance;

  static Future<User?> signInUser(String email, String password) async {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = _auth.currentUser;
      print(user?.uid);
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email' : {
          print("Email xato");
          break;
        }
        case 'user-not-found' : {
          print("User mavjud emas");
        }
      }
    }
    return null;
  }

  static Future<User?> signUpUser(String email, String password) async {
    try {
      _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = _auth.currentUser;
      print(user?.uid);
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email' : {
          print("Email xato");
          break;
        }
        case 'uid-already-exists' : {
          print("User oldindan mavjud");
        }
      }
    }
    return null;
  }

  static Future<void> signOutUser() async {
    await _auth.signOut();
  }

}