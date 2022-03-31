import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:smart_metrics/controllers/FieldsController.dart';
import 'package:smart_metrics/controllers/LocationController.dart';
import 'package:smart_metrics/models/Field.dart';
import 'package:smart_metrics/ui/widgets/myText.dart';

import 'widgets/button.dart';
import 'widgets/textField.dart';

class NewFieldView extends StatefulWidget {
  @override
  State<NewFieldView> createState() => _NewFieldViewState();
}

class _NewFieldViewState extends State<NewFieldView> {
  @override
  void initState() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    lat = Get.find<LocationController>().latitude.value;
    long = Get.find<LocationController>().longitude.value;
    super.initState();
  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    // target: LatLng(37.42796133580664, -122.085749655962),
    target: LatLng(Get.find<LocationController>().latitude.value,
        Get.find<LocationController>().longitude.value),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  double _sliderValue = 500.0;

  bool _newFieldView = false;

  double lat;

  double long;

  final controller = Get.put(FieldsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [

            GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,

              initialCameraPosition: _kGooglePlex,

              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              onTap: (value) {
                controller.latitude.value = value.latitude;
                controller.longitude.value = value.longitude;
                controller.setCircles(
                    lat: value.latitude, long: value.longitude);
                Logger().d(controller.latitude.value);
                Logger().e(value.latitude);
                setState(() {});
              },
              circles: controller.circles,
              onCameraMove: null,
            ),
            if (_newFieldView == false) buildNewSiteView(),
            if (_newFieldView == true) buildNewFieldView()
          ],
        ),
      );
    });
  }














  Widget buildNewSiteView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.w),
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            'New Field',
            weigt: FontWeight.w700,
            size: 22,
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFieldWidgets(
            controller: controller.siteController,
            hintText: 'write new site..',
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Radius of action',
                style: TextStyle(
                  fontFamily: 'SF UI Text',
                  fontSize: 14.sp,
                  color: const Color(0xff95989a),
                ),
              ),
              Text(
                '${controller.sliderValue.value.toInt()}m²',
                style: TextStyle(
                  fontFamily: 'SF UI Text',
                  fontSize: 16.sp,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Slider(
            value: controller.sliderValue.value,
            onChanged: (value) {
              controller.sliderValue.value = value;
              controller.setCircles(
                  lat: controller.latitude.value,
                  long: controller.longitude.value);
              setState(() {});
            },
            min: 0,
            max: 1000,
          ),
          SizedBox(
            height: 5.h,
          ),
          ButtonWidget(
            'Apply',
            function: () {
              _newFieldView = true;
              setState(() {});
            },
          )
        ],
      ),
    );
  } // end of NewSiteView

  Widget buildNewFieldView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.w),
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            'New Field',
            weigt: FontWeight.w700,
            size: 22,
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFieldWidgets(
            controller: controller.newFieldController,
            hintText: 'write new field..',
          ),
          SizedBox(
            height: 10.h,
          ),
          MyText(
            'Crop Type',
            weigt: FontWeight.w700,
            size: 22,
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFieldWidgets(
            controller: controller.cropTypeController,
            hintText: 'write crop type..',
          ),
          SizedBox(
            height: 15.h,
          ),
          controller.addToFirestoreLoading.value == true
              ? Center(child: CircularProgressIndicator())
              : ButtonWidget(
                  'Apply',
                  function: () async {
                    controller.addFieldToFirestore();
                  },
                )
        ],
      ),
    );
  } // end of NewSiteView

}
