import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';

class ButtonNot extends StatelessWidget {
  // const ButtonWidget({Key? key}) : super(key: key);
  String label;
  Color color;
  ButtonNot(this.label,this.color);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      height: 25.h,



      child: ElevatedButton(




        child: MyText(
          label,
          color: Colors.white,
          size: 13.sp,
          weigt: FontWeight.bold,
        ),


        style :ButtonStyle(
          backgroundColor:  MaterialStateProperty.all(color),
          shadowColor: MaterialStateProperty.all(color) ,

          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(37))),
        ),









        onPressed: () {},
      ),
    );
  }
}
