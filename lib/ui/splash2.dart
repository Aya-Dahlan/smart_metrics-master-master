import 'package:flutter/material.dart';
import 'package:smart_metrics/ui/widgets/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_metrics/ui/widgets/button2.dart';
import 'package:smart_metrics/ui/widgets/textField.dart';


class SplashPage2 extends StatelessWidget {
 // const SplashPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Padding(
          padding:  EdgeInsets.only(top:32),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/images/logo.png"),
                SizedBox(
                  height: 70.h,
                ),
                ButtonWidget('Get Started'),
                SizedBox(
                  height: 20.h,
                ),
                ButtonWidget2(),
             //  TextFieldWidgets(hintText: "Email",prefixIcon: Icon(Icons.email_outlined),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
