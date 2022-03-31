

import 'package:get/get.dart';
import 'package:smart_metrics/ui/login_sign/mainPage.dart';
import 'package:smart_metrics/ui/splash.dart';

import '../ui/bottom_pages/main_page.dart';
import 'Routers.dart';

class Pages {
 static List<GetPage> getPages = [
   GetPage(name: Routers.initialRoute, page: ()=> SplashPage()   ) ,
   GetPage(name: Routers.homeRoute, page: ()=> MainPageBottom()   ) ,
   GetPage(name: Routers.authPage, page: ()=> MainPage()   ) ,




 ] ; 

}