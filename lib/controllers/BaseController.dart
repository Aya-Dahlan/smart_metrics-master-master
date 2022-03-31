import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

mixin BaseController {
  void showDialog() {
    Get.dialog(
        Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 150),
          backgroundColor: Colors.white.withOpacity(0.9),
          child: Container(
            height: 80,
            width: 5,
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
        barrierDismissible: false);
  }

  void hideDialog() {
    if (Get.isDialogOpen) {
      Get.back();
    }
  }


   passwordValidate(String value) {
    if (value.isEmpty) {
      return 'Empty field please try again';
    }
    if (value.length <= 6) {
      return 'Password must be more than 7 characters';
    }
    return ;
  }


   passwordConfirmValidate(String value, String controllerText) {
    if (value.isEmpty) {
      return 'Empty field please try again';
    } else if (value.length <= 6) {
      return 'Password must be more than 7 characters';
    } else if (value != controllerText) {
      return 'Please confirm password again , dos\'nt match';
    }
    return ;
  }

   usernameValidate(String value) {
    if (value.isEmpty ) {
      return 'Please write username';
    } else if (value.length <= 3) {
      return 'this username is short , please try again';
    }
    return ;
  }

   formValidate(GlobalKey<FormState> formKy) {
    if (formKy.currentState.validate()) {
      SystemChannels.textInput.invokeMethod('TextInput.hide') ;
    //todo
    } else {
      //todo
    }

  }




}
