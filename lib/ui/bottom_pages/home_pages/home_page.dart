import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_metrics/controllers/AuthController.dart';
import 'package:smart_metrics/ui/bottom_pages/home_pages/widgets/post_widget.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';

import '../../DrawerView.dart';

class HomePage extends StatefulWidget {
  //const HomPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return SafeArea(
      child: Scaffold(
        drawer: Container(
          width: 150.w,
          color: Colors.red,
          height: double.infinity,
          child: null,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 23, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("assets/images/Group 3800.png"),
                  SizedBox(
                    width: 100.w,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Color(0xFF3E7D21),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.messenger,
                      color: Color(0xFF3E7D21),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => DrawerView());
                      // controller.signOut();
                    },
                    child: Container(
                      width: 33.w,
                      height: 33.h,
                      child: Image.asset("assets/images/Oval2.png"),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              MyText(
                "Home Page",
                weigt: FontWeight.bold,
                size: 22.sp,
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        PostWidget(),
                        PostWidget(),
                        PostWidget(),
                        PostWidget(),
                        PostWidget(),
                        PostWidget(),
                      ],
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
