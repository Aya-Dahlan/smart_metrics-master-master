import 'package:flutter/cupertino.dart';
import 'package:smart_metrics/ui/bottom_pages/notification_pages/widgets/not_widgets.dart';

class Notifications extends StatelessWidget {
//  const Notifications ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    ),);
  }
}
