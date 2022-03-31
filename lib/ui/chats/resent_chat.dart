import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ResentChatsPage extends StatefulWidget {
  // const ResentChatsPage({Key? key}) : super(key: key);

  @override
  _ResentChatsPageState createState() => _ResentChatsPageState();
}

class _ResentChatsPageState extends State<ResentChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: MyText(
          'Recent Chats',
         size: 16.sp,
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.list_outlined,color: Colors.black,),),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_add_alt_1_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
        scrollDirection: Axis.vertical,
        itemBuilder: (contex, index) {
          return  ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/Oval.png'),
            ),
            title: MyText('catherine  Henderson'),
            subtitle: MyText('Hella nawhal cosby s'),
            horizontalTitleGap: 5,
            trailing: MyText('1h'),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
            thickness: 1,
          );
        },
        itemCount: 20,
      ),
    );
  }
}
