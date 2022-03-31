import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:smart_metrics/controllers/LocationController.dart';
import 'package:smart_metrics/ui/login_sign/mainPage.dart';

import '../app/Routers.dart';
import '../services/FirebaseAuthServices.dart';
import '../ui/NoInternetConnection.dart';
import 'BaseController.dart';
import 'NetworkController.dart';
import 'SocialAuthController.dart';

class AuthController extends GetxController
    with BaseController, SocialAuthController {
  final network = Get.put(NetworkController());

  // final location = Get.put(LocationController());

  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  var user = FirebaseAuth.instance.currentUser.obs;

  getUser() async {
    var storageUser = await GetStorage().read('user');
    if (storageUser != null) {
      user.value = storageUser;
    }
  }

  Future<void> redirect() async {
    getUser();

    if (user.value != null ) {
      Future.delayed(Duration(seconds: 3)).then((value) {
        Get.offNamed(Routers.homeRoute);
      }).catchError((e) {
        print('${e.toString()}');
      });
    } else {
      Future.delayed(Duration(seconds: 3)).then((value) {
        Get.offNamed(Routers.authPage);
      });
    }
  }

  // login ****

  // login UI variables
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController loginEmailController = TextEditingController();

  TextEditingController loginPasswordController = TextEditingController();

  var isLoginLoading = false.obs;

  // login method
  login() async {
    isLoginLoading.value = true;
    if (network.connectionStatus.value == 1 ||
        network.connectionStatus.value == 2) {
      final response = await _authServices
          .signInWithEmailAndPassword(
              email: loginEmailController.text,
              password: loginPasswordController.text)
          .then((value) {
        isSignUpLoading.value = false;

        // Get.offAllNamed(Routers.homeRoute);
      });

      isLoginLoading.value = false;
    } else {
      isLoginLoading.value = false;
      Get.to(() => NoInternetConnection());
    }

    isLoginLoading.value = false;
  }

// login Validate
  loginFormValidate() {
    if (loginFormKey.currentState.validate()) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      login();
    } else {
      //todo
    }
  }

  //GetStarted

  // GetStarted UI variables
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  TextEditingController signUpEmailController = TextEditingController();

  TextEditingController signUpPasswordController = TextEditingController();

  TextEditingController signUpConfirmPasswordController =
      TextEditingController();

  var isSignUpLoading = false.obs;

  // GetStart Method
  signUp() async {
    isSignUpLoading.value = true;
    if (network.connectionStatus.value == 1 ||
        network.connectionStatus.value == 2) {
      final response = await _authServices
          .createUserWithEmailAndPassword(
              email: signUpEmailController.text,
              password: signUpPasswordController.text)
          .then((value) {
        isSignUpLoading.value = false;
      });
    } else {
      isSignUpLoading.value = false;
      Get.to(() => NoInternetConnection());
    }
    isSignUpLoading.value = false;
  }

  // GetStart Validate
  signUpFormValidate() {
    if (signUpFormKey.currentState.validate()) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');

      signUp();
    } else {
      //todo
    }
  }


  var isGoogleSignInLoading = false.obs;

  googleSignIn() async {
    isGoogleSignInLoading.value = true;
    try{
      await _authServices.signInWithGoogle();
      var user = FirebaseAuth.instance.currentUser;
      await GetStorage().write('user', user);
    } catch (e) {
      print(e.toString()) ;
    }
    isGoogleSignInLoading.value = false;
    Get.offAllNamed(Routers.homeRoute);


  }

  signOut() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    FirebaseAuthServices _authServices = FirebaseAuthServices();
    await _authServices.signOut();
    // await _googleSignIn.disconnect();
    // await _googleSignIn.signOut();
    await GetStorage().remove('user');
    Get.offAll(()=>MainPage());
  }

  @override
  void onInit() {
    redirect();
    super.onInit();
  }
}
