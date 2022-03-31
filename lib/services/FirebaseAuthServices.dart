import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

import '../app/Routers.dart';

class FirebaseAuthServices {
  Future<Response> createUserWithEmailAndPassword(
      {@required String email, @required String password}) async {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      Logger().i('after create');
      if (userCredential != null) {
        Logger().i('after create !null');
        if (userCredential.user.email != null &&
            !userCredential.user.emailVerified) {
          await userCredential.user.sendEmailVerification();
          // Get.snackbar('Email no\'t verified',
          //     'verified you\'r account , check email address');
        }
        if (FirebaseAuth.instance.currentUser != null) {
          var user = FirebaseAuth.instance.currentUser;
          await GetStorage().write('user', user);
        }
        Get.snackbar('', 'sign up success enjoy');
        Get.offAllNamed(Routers.homeRoute);
      } else {
        Logger().i('after create null');
        Get.offAllNamed(Routers.loginRoute);
      }

      Logger().i('create user');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('weak password', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
            'email already used', 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signInWithEmailAndPassword(
      {@required String email, @required String password}) async {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    try {
      Logger().i('before login');
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      Logger().i('after login');
      if (userCredential != null) {
        Logger().i('login not null');

        if (!userCredential.user.emailVerified) {
          await userCredential.user.sendEmailVerification();
          Get.snackbar('Email no\'t verified',
              'verified you\'r account , check email address');
          // signOut();
        } else {
          Get.snackbar('', 'log in success enjoy');
        }
        if (FirebaseAuth.instance.currentUser != null) {
          var user = FirebaseAuth.instance.currentUser;
          await GetStorage().write('user', user);
        }
        Get.offAllNamed(Routers.homeRoute);
      } else {
        Logger().i('login null');
        Get.offAllNamed(Routers.loginRoute);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('user not found', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
            'wrong password', 'Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
