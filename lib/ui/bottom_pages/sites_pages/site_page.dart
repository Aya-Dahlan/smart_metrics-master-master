import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:smart_metrics/controllers/LocationController.dart';
import 'package:smart_metrics/controllers/NetworkController.dart';
import 'package:smart_metrics/models/Field.dart';
import 'package:smart_metrics/services/FirestoreServices.dart';
import 'package:smart_metrics/ui/DrawerView.dart';
import 'package:smart_metrics/ui/NewFieldView.dart';
import 'package:smart_metrics/ui/NoInternetConnection.dart';
import 'package:smart_metrics/ui/bottom_pages/sites_pages/widgets/button.dart';
import 'package:smart_metrics/ui/bottom_pages/sites_pages/widgets/sites_widget.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';

import '../../../controllers/WeatherModel.dart';
import '../../../models/Weather.dart';

class SitesPage extends StatefulWidget {
  @override
  State<SitesPage> createState() => _SitesPageState();
}

class _SitesPageState extends State<SitesPage> {
  final controller = Get.put(LocationController());

  FirestoreServices _firestoreServices = FirestoreServices();

  FirebaseAuth _auth = FirebaseAuth.instance;

  List<Field> fields = [];

  bool loading = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    loading = true;

    if (Get.find<NetworkController>().connectionStatus.value == 1 ||
        Get.find<NetworkController>().connectionStatus.value == 2) {
      await _firestoreServices.fieldsCollection
          .doc(_auth.currentUser.uid)
          .collection('meetings')
          .get()
          .then((val) {
        if (val.docs.length > 0) {
          fields = [];
          var snapshot = val.docs;
          try {
            snapshot.forEach((element) {
              Field field = Field()
                ..siteName = element.data()['siteName']
                ..field = element.data()['field']
                ..radius = element.data()['radius']
                ..createdTime = element.data()['createdTime']
                ..lat = element.data()['lat']
                ..long = element.data()['long']
                ..cropType = element.data()['cropType'];

              fields.add(field);
            });
          } catch (e) {
            Logger().w(e.toString());
          }
          loading = false;
          setState(() {});
        } else {
          loading = false;
          print("Not Found");
        }
      });
    } else {
      Get.to(() => NoInternetConnection());
      loading = false;
      setState(() {});
    }

    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 23, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("assets/images/Group 3800.png"),
                  SizedBox(
                    width: 100.w,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Color(0xFF3E7D21),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.messenger,
                      color: Color(0xFF3E7D21),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => DrawerView());
                    },
                    child: Container(
                      width: 33.w,
                      height: 33.h,
                      child: Image.asset("assets/images/Oval2.png"),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  MyText(
                    "Horticultural Fields Sites",
                    weigt: FontWeight.bold,
                    size: 22.sp,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),

                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => NewFieldView(),
                  //         ));
                  //   },
                  //   child: Container(
                  //     height: 20,
                  //     width: 20,
                  //     color: Colors.red,
                  //     child: null,
                  //   ),
                  // )
                  ButtonSite(),
                ],
              ),
              SizedBox(
                height: 7.h,
              ),
              Row(
                children: [
                  Container(
                    width: 5.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF0090FF),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  MyText("${fields.length} working"),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 5.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  MyText("1 paused"),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 5.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFC6C6C6),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  MyText("1 stopped"),
                ],
              ),
              loading == true
                  ? Center(child: CircularProgressIndicator())
                  : fields.length == 0
                      ? Expanded(
                          child: Center(
                            child: Text('There is no field yet'),
                          ),
                        )
                      : Container(
                          height: (Get.height - 240).h,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              var location = Get.find<LocationController>();
                              final weatherControlle = Get.put(WeatherController());

                              return SiteWiget(
                                // siteName: fields[index].siteName,
                                // createdTime: fields[index].createdTime,
                                // radius: fields[index].radius,
                                // cropType: fields[index].cropType,
                                // field: fields[index].field,
                                // lat: fields[index].lat,
                                // long: fields[index].long,

                                field: fields[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10.h,
                              );
                            },
                            itemCount: (fields.length),
                          ))
            ],
          ),
        ),
      ),
    );
  }
}
