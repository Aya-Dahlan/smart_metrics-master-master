import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_metrics/controllers/AuthController.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';
import 'package:smart_metrics/ui/widgets/textField.dart';

import '../widgets/button.dart';

class GetStartedPage extends StatefulWidget {
  //const SignInPage({Key? key}) : super(key: key);

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Center(
        child: SingleChildScrollView(
          child: Form(
            key: controller.signUpFormKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 77),
                  child: MyText(
                    'Become part of the future',
                    size: 24.sp,
                    color: Colors.black,
                    weigt: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                TextFieldWidgets(
                  hintText: 'E-mail',
                  controller: controller.signUpEmailController,
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
                  hintText: 'Creat password',
                  controller: controller.signUpPasswordController,
                  textInputType: TextInputType.visiblePassword,
                  prefixIcon: Icon(Icons.lock_outline_sharp),
                  suffexIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {},
                  ),
                  validator: (value) {
                    return controller.passwordValidate(value);
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextFieldWidgets(
                  hintText: 'Confirm password',
                  controller: controller.signUpConfirmPasswordController,
                  textInputType: TextInputType.visiblePassword,
                  prefixIcon: Icon(Icons.lock_outline_sharp),
                  suffexIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {},
                  ),
                  validator: (value) {
                    return controller.passwordConfirmValidate(
                        value, controller.signUpPasswordController.text);
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                controller.isSignUpLoading.value == true ? Center(
                    child: CircularProgressIndicator()) : ButtonWidget(
                    'Join in Agri Metrics', function: () {
                  controller.signUpFormValidate();
                }),
                SizedBox(
                  height: 17.h,
                ),
                MyText(
                  "By creating an account, you agree to Wasty",
                  color: Colors.black,
                  size: 13.sp,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: MyText(
                        "Terms of use",
                        weigt: FontWeight.bold,
                        size: 13.sp,
                        color: Color(0xFF4D8D6E),
                      ),
                    ),
                    MyText("and", size: 13, color: Colors.black,),
                    TextButton(
                      onPressed: () {

                      },
                      child: MyText(
                        "Privacy policy",
                        size: 13.sp,
                        weigt: FontWeight.bold,
                        color: Color(0xFF4D8D6E),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
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
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(

                      onTap: (){
                        // controller.googleSignIn() ;
                      },
                      child:  controller.isGoogleSignInLoading.value == true
                          ? Center(child: CircularProgressIndicator())
                          :Container(
                        width: 153.w,
                        height: 58.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset("assets/images/Group 3809.png"),
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
                            offset: Offset(0, 3), // changes position of shadow
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
      );
    });
  }
}
