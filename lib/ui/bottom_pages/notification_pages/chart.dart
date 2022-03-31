import 'package:flutter/cupertino.dart';
import 'package:smart_metrics/ui/bottom_pages/notification_pages/widgets/button.dart';
import 'package:smart_metrics/ui/bottom_pages/notification_pages/widgets/not_widgets.dart';
import 'package:flutter/material.dart';

import '../sites_pages/widgets/sites_widget.dart';

class Chart extends StatelessWidget {
  //const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0,right: 20,left: 20),
          child: SiteWiget(),
        ),
        Image.asset("assets/images/Group 193.png"),

      ],
    );
  }
}
