import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';

class ButtonWidget2 extends StatelessWidget {
  // const ButtonWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  margin:  EdgeInsets.all(25),
      width: 338.w,
      height: 63.h,


      // decoration:  BoxDecoration(
      // //  color:
      //   color: Color(0xFF3E7D21),
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      // ),
      child: ElevatedButton(




        child: MyText(
          "login",
          color: Colors.black,
          size: 22.sp,
          weigt: FontWeight.bold,
        ),

        style :ButtonStyle(
          backgroundColor:  MaterialStateProperty.all(Colors.white),
          shadowColor: MaterialStateProperty.all(Color(0xFF3E7D21)) ,


          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF3E7D21)),
                  borderRadius: BorderRadius.circular(37))),
        ),









        onPressed: () {},
      ),
    );
  }
}
