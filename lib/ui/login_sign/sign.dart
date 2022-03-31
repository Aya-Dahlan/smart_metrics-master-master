import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:smart_metrics/controllers/AuthController.dart';
import 'package:smart_metrics/controllers/firebase_auth_controller.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';
import 'package:smart_metrics/ui/widgets/textField.dart';

import '../widgets/button.dart';

class SignInPage extends StatefulWidget {
  //const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 77),
                    child: MyText(
                      'Login in your account',
                      size: 24.sp,
                      color: Colors.black,
                      weigt: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  TextFieldWidgets(
                    controller: controller.loginEmailController,
                    hintText: 'E-mail',
                    textInputType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email_outlined),
                    validator: (value) {
                      return controller.usernameValidate(value);
                    },
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  TextFieldWidgets(
                    controller: controller.loginPasswordController,
                    obscureText: true,
                    hintText: 'Password',
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      return controller.passwordValidate(value);
                    },
                    prefixIcon: Icon(Icons.lock_outline_sharp),
                    suffexIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye_rounded),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 220),
                    child: TextButton(
                        onPressed: () {},
                        child: MyText(
                          "Forget password?",
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  controller.isLoginLoading.value == true
                      ? Center(child: CircularProgressIndicator())
                      : ButtonWidget(
                          'Login',
                          function: () async {
                            controller.loginFormValidate();
                          },
                        ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.w,
                        height: 0.5.h,
                        color: Colors.grey.shade800,
                      ),
                      MyText(
                        ' or connect with ',
                        color: Colors.black,
                      ),
                      Container(
                        width: 100.w,
                        height: 0.5.h,
                        color: Colors.grey.shade800,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // controller.googleSignIn();
                        },
                        child: controller.isGoogleSignInLoading.value == true
                            ? Center(child: CircularProgressIndicator())
                            : Container(
                                width: 153.w,
                                height: 58.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 1,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child:
                                    Image.asset("assets/images/Group 3809.png"),
                              ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Container(
                        width: 153.w,
                        height: 58.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset("assets/images/Group 3810.png"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

// Future performLogin() async {
//   if (checkData()) {
//     await login();
//   }
// }
// Future performCreatAccount()async{
//   if (checkData()) {
//     await creartAccount();
//   }
// }

// bool checkData() {
//   if (emailTextEditingController.text.isNotEmpty &&
//       passTextEditingController.text.isNotEmpty) {
//     return true;
//   }
//   return false;
// }
//
// Future login() async {
//   UserCredential userCredential = await FirebaseAuthController().signIn(
//       emailTextEditingController.text, passTextEditingController.text);
//   if(userCredential!=null){}
// }
//
// Future creartAccount()async{
//   UserCredential userCredential=await FirebaseAuthController().creatAccount(emailTextEditingController.text
//       , passTextEditingController.text);
//   if(userCredential!=null){}
// }
}
