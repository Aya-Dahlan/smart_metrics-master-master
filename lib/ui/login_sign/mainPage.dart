import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_metrics/ui/login_sign/getStart.dart';
import 'package:smart_metrics/ui/login_sign/sign.dart';


import '../splash2.dart';

class MainPage extends StatefulWidget  {
  //const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  List<Widget> _tabBarSecreens = [
    SignInPage(),
    GetStartedPage(),
  ];
  TabController _tabBarController;

  @override
  void initState() {
    _tabBarController =
        new TabController(length: _tabBarSecreens.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 30,

        bottom: TabBar(
          controller: _tabBarController,
          isScrollable: false,
          indicatorColor: Color(0xFF3E7D21),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 1.5,
          unselectedLabelColor: Color(0xFF3E7D21).withOpacity(0.3),
          labelStyle: TextStyle(fontSize: 16.sp,fontFamily: "PT",fontWeight: FontWeight.bold),
          labelColor: Color(0xFF3E7D21),
          onTap: (int currentTapIndex) {},
          tabs: [
            Tab(text: "Sign In",),
            Tab(text: "Get Started"),
          ],
        ),
      ),
      body:  TabBarView(
        controller: _tabBarController,
        children: _tabBarSecreens,
      ),
    );
  }
}
