import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_metrics/ui/bottom_pages/profile_pages/widgets/button.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';

class ProfilePage extends StatefulWidget {
//  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, left: 18),
              child: Row(
                children: [
                  Image.asset("assets/images/stopwatch (1).png"),
                  SizedBox(
                    width: 9.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        "My time:",
                        size: 10.sp,
                      ),
                      MyText(
                        "User Status",
                        size: 18.sp,
                        color: Colors.black,
                        weigt: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 116.w,
                  ),
                  ButtonProf(),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 50, left: 18),
              child: Row(
                children: [
                  MyText(
                    "Show notifications",
                    size: 14.sp,
                  ),
                  SizedBox(
                    width: 160.w,
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Colors.green,
                    activeColor: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 31.h,
            ),
            Container(
              width: 370.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    MyText("Email", size: 14.sp),
                    SizedBox(
                      width: 120.w,
                    ),
                    MyText("ayaalidahl@gmail.com", size: 14.sp),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 20,
                          color: Colors.grey.shade400,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 370.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    MyText("Set new password", size: 14.sp),
                    SizedBox(
                      width: 180.w,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 20,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 46.h,
            ),

            MyText("Statistics of consumption of hours",size: 14.sp,color: Colors.black,weigt: FontWeight.bold,),
            SizedBox(
              height: 20.h,
            ),

            Image.asset("assets/images/Group 187.png")
          ],
        ),
      ),
    );
  }
}
