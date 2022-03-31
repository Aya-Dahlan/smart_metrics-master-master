import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_metrics/controllers/LocationController.dart';
import 'package:smart_metrics/controllers/WeatherModel.dart';
import 'package:smart_metrics/models/Field.dart';
import 'package:smart_metrics/models/Weather.dart';
import 'package:smart_metrics/models/location.dart.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';

class SiteWiget extends StatefulWidget {
  //
  // String siteName;
  //
  // double radius;
  //
  // String field;
  //
  // String cropType;
  //
  // Timestamp createdTime;
  //
  // double lat;
  //
  // double long;

  Field field;

  //
  // SiteWiget({
  //   this.siteName,
  //   this.radius,
  //   this.cropType,
  //   this.field,
  //   this.createdTime,
  //   this.long,
  //   this.lat,
  // });

  SiteWiget({this.field});

  @override
  _SiteWigetState createState() => _SiteWigetState();
}

class _SiteWigetState extends State<SiteWiget> {
  // Weather weather;
  final weatherControlle = Get.find<WeatherController>();

  @override
  void initState() {
     weatherControlle.getCurrentWeatherByLatLong(lat: widget.field.lat, long: widget.field.long);
    // weatherControlle.getCurrentWeatherByLatLong(
    //     lat: widget.field.lat, long: widget.field.long);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Obx(() {

      Location location = weatherControlle.locationModel.value;
      Weather weather = Get.find<WeatherController>().weather.value ;
      return weatherControlle.loading.value == true
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  Container(
                    width: 343.w,
                    height: 250.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Image.asset(
                      "assets/images/snazzy-image (5).png",
                      fit: BoxFit.cover,
                      // width: 400.w,
                      // height: 300.h,
                    ),
                  ),
                  Container(
                    width: 343.w,
                    height: 250.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xA30090FF),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  widget.field.siteName ?? '',
                                  size: 22.sp,
                                  weigt: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              // SizedBox(
                              //   width: 100.w,
                              // ),
                              if (weather.isDay == 1)
                                Expanded(
                                    child: weather.condition.icon == null
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : Image.asset(
                                            'assets/day/${weather.condition.icon.split("/").last}',
                                            color: Colors.white,
                                          )),
                              if (weather.isDay == 0)
                                Expanded(
                                    child: weather.condition.icon == null
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : Image.asset(
                                            'assets/night/${weather.condition.icon.split("/").last}',
                                            color: Colors.white,
                                          ))
                            ],
                          ),
                        ),
                        MyText(
                          '${widget.field.siteName ?? ''} ${location.name ?? ''} ${location.region ?? ''} ${location.tzId.split('/').last ?? ''} ${location.country ?? ''}' ??
                              '',
                          size: 12.sp,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Row(
                          children: [
                            MyText(
                              "${weather.tempC} C" ?? '',
                              size: 28.sp,
                              weigt: FontWeight.bold,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 43.w,
                            ),
                            Image.asset("assets/images/Path 48.png"),
                            SizedBox(
                              width: 8.w,
                            ),
                            MyText(
                              "${weather.cloud} %" ?? "",
                              size: 15.sp,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyText(
                              "${weather.windMph}%H" ?? '',
                              size: 28.sp,
                              weigt: FontWeight.bold,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 26.w,
                            ),
                            Image.asset("assets/images/wind (1).png"),
                            SizedBox(
                              width: 8.w,
                            ),
                            MyText(
                              "${weather.windDegree} %" ?? '',
                              size: 15.sp,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        MyText(
                            "Date Created: ${DateFormat.yMMMEd().format(DateTime.now())}     Space:3.5 Donum"),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 46.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                color: Color(0xB33E7D21),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Column(
                                  children: [
                                    MyText(
                                      "15",
                                      size: 14.sp,
                                      color: Colors.white,
                                      weigt: FontWeight.bold,
                                    ),
                                    MyText(
                                      "Sun",
                                      size: 13.sp,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width: 46.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                color: Color(0xB33E7D21),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Column(
                                  children: [
                                    MyText(
                                      "15",
                                      size: 14.sp,
                                      color: Colors.white,
                                      weigt: FontWeight.bold,
                                    ),
                                    MyText(
                                      "Sun",
                                      size: 13.sp,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width: 46.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                color: Color(0xB33E7D21),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Column(
                                  children: [
                                    MyText(
                                      "15",
                                      size: 14.sp,
                                      color: Colors.white,
                                      weigt: FontWeight.bold,
                                    ),
                                    MyText(
                                      "Sun",
                                      size: 13.sp,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width: 46.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                color: Color(0xB33E7D21),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Column(
                                  children: [
                                    MyText(
                                      "15",
                                      size: 14.sp,
                                      color: Colors.white,
                                      weigt: FontWeight.bold,
                                    ),
                                    MyText(
                                      "Sun",
                                      size: 13.sp,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                                width: 46.w,
                                height: 45.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                                child: Icon(
                                  Icons.calendar_today_outlined,
                                  color: Color(0xFF3E7D21),
                                  size: 28,
                                )),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                                width: 46.w,
                                height: 45.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                                child: Image.asset(
                                    "assets/images/Path 11635.png")),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
    });
  }
}
