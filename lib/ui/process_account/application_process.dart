import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';

class YourApplicationPage extends StatelessWidget {
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
              Image.asset("assets/images/3.png"),
              SizedBox(
                height:58.h ,
              ),
              MyText("Your application processed",size: 24.sp,color: Colors.black,weigt: FontWeight.w900,),
              SizedBox(
                height:240.h ,
              ),
              MyText("Create a model of rain"),


            ],
          ),
        ),
      ),
    );
  }
}
