import 'package:flutter/material.dart';

import '../../../widgets/myText.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostWidget extends StatefulWidget {
  //const PostWidget({Key? key}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return             Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: 450.w,
        height: 420.h,
        decoration: BoxDecoration(
          color: Color(0x45B8CADE),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 33.w,
                    height: 33.h,
                    child: Image.asset("assets/images/Oval2.png"),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        "Hisham Ali",
                        size: 14.sp,
                        color: Color(0xFF19295C),
                        weigt: FontWeight.bold,
                      ),
                      MyText(
                        "Agricultural Engineer  ",
                        size: 11.sp,
                        color: Color(0xFF19295C),
                        weigt: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.public,
                            size: 16,
                            color: Colors.grey.shade400,
                          ),
                          MyText(
                            " 1 day ago",
                            size: 10.sp,
                            color: Colors.grey.shade400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  MyText(
                    "Type: public",
                    size: 7.sp,
                    color: Color(0xFF19295C),
                    weigt: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Container(
                    width: 25.w,
                    height: 25.h,
                    child:
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Color(0xFF2196F3),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 25.w,
                    height: 25.h,
                    child:   Icon(
                      Icons.more_horiz,
                      size: 20,
                      color: Color(0xFF2196F3),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),

                ],
              ),
              SizedBox(
                height: 10.h,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: MyText("During a field visit to agricultural orchards for palms, olives and grapes in the Gaza Strip",
                  color: Color(0xFF444D6E),),


              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 300.w,
                  height: 200.h,
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset("assets/images/pexels-yuri-manei-2272854.png",fit: BoxFit.cover),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black,

                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),


              Padding(
                padding: const EdgeInsets.only(right: 45),
                child: MyText("Dear Farmer, Put The Appropriate Rating For This Post",

                  size: 12.sp,
                  color: Color(0xFF747EA0),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20, left: 90,right: 90),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 35.w,
                          height: 35.h,
                          child:   Image.asset("assets/images/Group 4.png"),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),

                        MyText("1",size: 8.sp,),


                      ],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),Column(
                      children: [
                        Container(
                          width: 35.w,
                          height: 35.h,
                          child:   Icon(Icons.star,
                            color: Color(0xFF2196F3),),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),

                        MyText("14",size: 8.sp,),

                      ],
                    ),    SizedBox(
                      width: 5.w,
                    ),Column(
                      children: [
                        Container(
                          width: 35.w,
                          height: 35.h,
                          child:  Row(
                            children: [
                              Icon(Icons.star,
                                size: 18,
                                color: Color(0xFF3E7D21),),
                              Icon(Icons.star,
                                size: 18,
                                color: Color(0xFF3E7D21),),
                            ],
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),

                        MyText("25",size: 8.sp,),

                      ],
                    ),   SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 35.w,
                          height: 35.h,
                          child: Icon(Icons.favorite,color: Colors.red.shade900,size: 20,),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),
                        MyText(
                          "1",
                          size: 8.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
