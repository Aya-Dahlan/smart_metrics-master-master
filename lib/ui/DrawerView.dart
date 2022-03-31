import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/AuthController.dart';


class DrawerView extends StatelessWidget {
  final authController = Get.put(AuthController()) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: Get.height.h,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                color: Color(0xffADC7A2),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundImage:
                          AssetImage('assets/images/Oval2.png'),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hisham Ali',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20.sp,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                                height: 1.5454545454545454,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                            Text(
                              'Gaza City , Gaza Strip',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14.sp,
                                color: const Color(0xffffffff),
                                height: 2.1666666666666665,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.person,
                  size: 30.r,
                  color: Color(0xff4D8D6E),
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18.sp,
                    color: const Color(0xff292929),
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                  ),
                ),
                trailing: null,
              ),
              SizedBox(
                height: 10.h,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.dashboard,
                  size: 30.r,
                  color: Color(0xff4D8D6E),
                ),
                title: Text(
                  'Dashboard',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18.sp,
                    color: const Color(0xff292929),
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                  ),
                ),
                trailing: null,
              ),
              SizedBox(
                height: 10.h,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.contact_support_outlined,
                  size: 30.r,
                  color: Color(0xff4D8D6E),
                ),
                title: Text(
                  'Support Center',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18.sp,
                    color: const Color(0xff292929),
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                  ),
                ),
                trailing: null,
              ),
           SizedBox(height: 100.h,) ,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'About us',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Privacy',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Terms of Use',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'FAQ',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ListTile(
                      onTap: () {
                        authController.signOut() ;
                      },
                      leading: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.red),
                      ),
                      trailing: null,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}