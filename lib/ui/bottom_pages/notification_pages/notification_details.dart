import 'package:flutter/material.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../login_sign/getStart.dart';
import '../../login_sign/sign.dart';
import '../sites_pages/widgets/sites_widget.dart';
import 'chart.dart';
import 'notifications.dart';

class NotificationDetails extends StatefulWidget {
 // const NotificationDetails({Key? key}) : super(key: key);

  @override
  _NotificationDetailsState createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> with SingleTickerProviderStateMixin  {
  List<Widget> _tabBarSecreens = [
    Notifications(),
    Chart(),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: MyText("Notification Details",color: Colors.white,),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF3E7D21),
        // toolbarHeight: 30,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back,color: Colors.white,),

        ),
        bottom:  TabBar(
          controller: _tabBarController,
          isScrollable: false,
          indicatorColor: Color(0xFF3E7D21),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 1.5,
          unselectedLabelColor: Colors.white.withOpacity(0.3),
          labelStyle: TextStyle(fontSize: 16.sp,fontFamily: "PT",fontWeight: FontWeight.bold),
          labelColor: Colors.white,
          onTap: (int currentTapIndex) {},
          tabs: [
            Tab(text: "NOTIFACTION",),
            Tab(text: "CHART"),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabBarController,
        children: _tabBarSecreens,
      ),
    );
  }
}
