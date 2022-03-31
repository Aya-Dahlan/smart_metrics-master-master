import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';

import '../../../NewFieldView.dart';

class ButtonSite extends StatelessWidget {
  // const ButtonWidget({Key? key}) : super(key: key);
  String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 25.h,
      child: ElevatedButton(
        child: MyText(
          "New Field",
          color: Colors.white,
          size: 13.sp,
          weigt: FontWeight.bold,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFF3E7D21)),
          shadowColor: MaterialStateProperty.all(Color(0xFF3E7D21)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(37))),
        ),
        onPressed: () {
          Get.to(()=>NewFieldView());
        },
      ),
    );
  }
}
