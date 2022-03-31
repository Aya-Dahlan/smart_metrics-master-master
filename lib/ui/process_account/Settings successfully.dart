import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';

class SettingsSuccessfullyPage extends StatelessWidget {
  //const YourApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 150),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/Group 3848.png"),
              SizedBox(
                height:58.h ,
              ),
              MyText("Settings successfully updated!",size: 24.sp,color: Colors.black,weigt: FontWeight.w900,),
              SizedBox(
                height:240.h ,
              ),
              Image.asset("assets/images/Group 171.png"),


            ],
          ),
        ),
      ),
    );
  }
}
