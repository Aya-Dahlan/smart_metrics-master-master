import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_metrics/ui/bottom_pages/notification_pages/widgets/button.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';



class NotWidget extends StatefulWidget {
//  const NotWidget({Key? key}) : super(key: key);

  @override
  _NotWidgetState createState() => _NotWidgetState();
}

class _NotWidgetState extends State<NotWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 20,bottom: 10),
      child: Container(
        // width: 332.w,
        // height: 81.h,
        child: Row(
          children: [
            Container(
              width: 270.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(

                    "Olive Field  commented your comment on How to produce best fertilizer for Grape",
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    softWrap: true,


                    style: TextStyle(
                      fontFamily: "PT",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,



                    ),


                  ),

                  TextButton(onPressed: (){}, child: MyText("Chart"))

                ],


              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              children: [
                ButtonNot("Yes",Colors.green),
                SizedBox(
                  height: 5.h,
                ),
                ButtonNot("No",Colors.red),
              ],
            )
          ],


        ),
      ),
    );
  }
}
