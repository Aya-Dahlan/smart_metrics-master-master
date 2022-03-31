import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';

class ProcessingPage extends StatelessWidget {
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
              Image.asset("assets/images/Group 452.png"),
              SizedBox(
                height:100.h ,
              ),
              MyText("Please Wait",size: 24.sp,color: Colors.black,),


            ],
          ),
        ),
      ),
    );
  }
}
