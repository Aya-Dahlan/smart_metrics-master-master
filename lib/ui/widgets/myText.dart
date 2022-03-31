import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyText extends StatelessWidget {
  String data;
  double size;
  Color color;
    FontWeight weigt;

  MyText(this.data, {this.size, this.color,this.weigt});

   @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style:  TextStyle(
        fontFamily: "PT",
         fontSize:  size,
        fontWeight: weigt,
        color: color,
      ),
    );
  }
}
