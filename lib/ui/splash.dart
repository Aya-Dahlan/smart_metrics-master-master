import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:smart_metrics/controllers/AuthController.dart';
import 'package:smart_metrics/controllers/NetworkController.dart';


class SplashPage extends StatefulWidget {
  //const SplashPage({Key? key}) : super(key: key);


  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
 final controller = Get.find<AuthController>() ;

    super.initState();
    Firebase.initializeApp();


    // Future.delayed( Duration(seconds: 3),(){
    //   Navigator.pushReplacementNamed((context),'/MainPageLogin');
    // });
  }

  @override
  Widget build(BuildContext context) {
  //  super.initState();



    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Image.asset("assets/images/splash.png"),
      ),

    );
  }
}
