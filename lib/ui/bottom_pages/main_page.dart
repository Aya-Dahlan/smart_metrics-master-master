import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_metrics/ui/NewFieldView.dart';
import 'package:smart_metrics/ui/bottom_pages/profile_pages/profile_page.dart';
import 'package:smart_metrics/ui/bottom_pages/sites_pages/site_page.dart';
import 'package:smart_metrics/ui/login_sign/mainPage.dart';

import 'home_pages/home_page.dart';
import 'notification_pages/notification_page.dart';

class MainPageBottom extends StatefulWidget {
//  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageBottomState createState() => _MainPageBottomState();
}

class _MainPageBottomState extends State<MainPageBottom> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavBar(
      actionButton: CurvedActionBar(
        onTab: (value) {
          /// perform action here
          print(value);
        },
        activeIcon: Container(
          padding: EdgeInsets.all(8),
          decoration:
              BoxDecoration(color: Color(0xFF3E7D21), shape: BoxShape.circle),
          child: Icon(
            Icons.qr_code_scanner_sharp,
            size: 60,
            color: Colors.white,
          ),
        ),
        inActiveIcon: Container(
          padding: EdgeInsets.all(8),
          decoration:
              BoxDecoration(color: Color(0xFF3E7D21), shape: BoxShape.circle),
          child: Icon(
            Icons.qr_code_scanner_sharp,
            size: 60,
            color: Colors.white,
          ),
        ),
      ),
      activeColor: Colors.black,
      navBarBackgroundColor: Colors.white,
      inActiveColor: Colors.black45,
      appBarItems: [
        FABBottomAppBarItem(

            activeIcon: Icon(
              Icons.home,
              color: Color(0xFF3E7D21),
            ),
            inActiveIcon: Icon(
              Icons.home,
              color: Colors.black26,
            ),
            text: 'Home'),
        FABBottomAppBarItem(
            activeIcon: Image.asset('assets/images/Group 179.png'),
            inActiveIcon: Image.asset('assets/images/Group 179.png'),
            text: 'Sites'),
                FABBottomAppBarItem(
            activeIcon: Icon(
              Icons.notifications,
              color: Color(0xFF3E7D21),
            ),
            inActiveIcon: Icon(
              Icons.notifications,
              color: Colors.black26,
            ),
            text: 'Notifactions'),
                FABBottomAppBarItem(
            activeIcon: Icon(
              Icons.person_outline_rounded,
              color: Color(0xFF3E7D21),
            ),
            inActiveIcon: Icon(
              Icons.person_outline_rounded,
              color: Colors.black26,
            ),
            text: 'profile'),

      ],
      bodyItems: [
       HomePage(),
        SitesPage(),
        NotificationPage(),
        ProfilePage(),
      ],
      actionBarView: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.orange,
      ),
    );
  }
}
