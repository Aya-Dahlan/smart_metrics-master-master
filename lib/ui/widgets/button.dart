import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';

class ButtonWidget extends StatelessWidget {
 // const ButtonWidget({Key? key}) : super(key: key);
String label;
Function function;
ButtonWidget(this.label, {this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 338.w,
      height: 63.h,



      child: ElevatedButton(





        child: MyText(
          label,
          color: Colors.white,
          size: 22.sp,
          weigt: FontWeight.bold,
        ),


          style :ButtonStyle(
            backgroundColor:  MaterialStateProperty.all(Color(0xFF3E7D21)),
             shadowColor: MaterialStateProperty.all(Color(0xFF3E7D21)) ,

            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(37))),
          ),









          onPressed: function,
      ),
    );
  }
}
