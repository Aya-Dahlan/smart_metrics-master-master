import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidgets extends StatelessWidget {
  //const TextFieldWidets({Key? key}) : super(key: key);
  String hintText;
  Icon prefixIcon = null;
  IconButton suffexIcon;
  bool tab = false;
  TextEditingController controller;
  bool obscureText;
  String Function(String) validator;

  TextInputType textInputType;

  TextFieldWidgets(
      {@required this.hintText,
      this.prefixIcon,
      this.suffexIcon,
      this.controller,
      this.obscureText = false,
      this.textInputType,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
     alignment: Alignment.center,
      width: 303.w,
      height: 50.h,
      clipBehavior: Clip.antiAlias,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),

      //margin: EdgeInsets.symmetri
      // c(horizontal: 20, vertical: 5),
      child: TextFormField(

        controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType,
        validator: validator,

        style: TextStyle(
          fontFamily: "PT",
        ),

        // showCursor: false,
        cursorColor: Color(0xFF3E7D21),

        decoration: InputDecoration(
          alignLabelWithHint: false ,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.h),
          // labelText: hintText,
          hintText: hintText ,
          filled: false,
          labelStyle: TextStyle(fontFamily: "PT", fontSize: 18.sp),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(color: Colors.black ,width: 0.3)),
          enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(color: Colors.black ,width: 0.3)),
          // border:  OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(15.r),
          //     borderSide: BorderSide(color: Colors.black)),
          prefixIcon: prefixIcon,
          suffixIcon: suffexIcon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
