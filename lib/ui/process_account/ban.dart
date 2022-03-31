import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';

class BANPage extends StatelessWidget {
  //const YourApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 150),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                "Your Account blocked",
                size: 24.sp,
                color: Colors.black,
                weigt: FontWeight.w900,
              ),
              SizedBox(
                height: 1.h,
              ),
              Image.asset("assets/images/Group 3849.png"),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 34, right: 34),
                child: Center(
                  child: Text(
                    "AgriMetrics was not created as a weapon, method of jokes, terrorism. We are convinced that nature is superior to humanity. Love your planet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "PT",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 89.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 34, right: 34),
                child: Center(
                  child: Text(
                    "     If you do not agree with the blocking, contact your service provider   ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontFamily: "PT",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
