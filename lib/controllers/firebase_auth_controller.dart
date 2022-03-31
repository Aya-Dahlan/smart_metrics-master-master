import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> creatAccount(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("creatAccont : code :" + e.code);
      if (e.code == "email-already-in-use") {
      } else if (e.code == "invalid-email") {
      } else if (e.code == "operation-not-allowed") {
      } else if (e.code == "weak-password") {}
    } catch (e) {
      print("creatAccont : Exception :$e");
    }
    return null;

  }

  Future<UserCredential> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("signIn : code :" + e.message);

      if (e.code == "invalid-email") {
      } else if (e.code == "user-disabled") {
      } else if (e.code == "user-not-found") {
      } else if (e.code == "wrong-password") {}
    } catch (e) {
      print("signIn : Exception :$e.message");
    }
    return null;
  }

  Future signOut()async{
    await _auth.signOut();

  }

}
