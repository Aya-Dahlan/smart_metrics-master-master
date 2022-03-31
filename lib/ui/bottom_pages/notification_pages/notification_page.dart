import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_metrics/ui/bottom_pages/notification_pages/widgets/not_widgets.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';

import 'widgets/button.dart';

class NotificationPage extends StatefulWidget {
  // const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: MyText(
          "Notifications",
          color: Colors.black,
          weigt: FontWeight.bold,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NotWidget(),
            NotWidget(),
            NotWidget(),
            NotWidget(),
            NotWidget(),
            NotWidget(),
            NotWidget(),
            NotWidget(),
            NotWidget(),
            NotWidget(),
            NotWidget(),
          ],
        ),
      )
    );
  }
}
