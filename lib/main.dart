import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:smart_metrics/app/Routers.dart';
import 'package:smart_metrics/app/pages.dart';
import 'package:smart_metrics/services/FirebaseAuthServices.dart';
import 'package:smart_metrics/ui/NewFieldView.dart';
import 'package:smart_metrics/ui/login_sign/mainPage.dart';
import 'package:smart_metrics/ui/splash.dart';
import 'package:smart_metrics/ui/splash2.dart';

import 'app/bindings.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 707),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: Routers.initialRoute,
              getPages: Pages.getPages,
              initialBinding: InitialBindings(),
              //initialRoute:'/splashPage' ,
         // home: NewFieldView(),
              routes: {
                '/splashPage': (context) => SplashPage(),
                '/splashPage2': (context) => SplashPage2(),
                '/MainPageLogin': (context) => MainPage(),
              },
            ));
  }
}
