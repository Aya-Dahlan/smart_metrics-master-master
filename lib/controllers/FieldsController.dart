import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:smart_metrics/controllers/LocationController.dart';
import 'package:smart_metrics/controllers/NetworkController.dart';
import 'package:smart_metrics/services/FirestoreServices.dart';
import 'package:smart_metrics/ui/NoInternetConnection.dart';
import 'package:smart_metrics/ui/bottom_pages/sites_pages/site_page.dart';

import '../models/Field.dart';

class FieldsController extends GetxController {
  final network = Get.find<NetworkController>();

  TextEditingController siteController = TextEditingController();

  TextEditingController newFieldController = TextEditingController();

  TextEditingController cropTypeController = TextEditingController();

  var sliderValue = 400.0.obs;

  var latitude = 0.0.obs;

  var longitude = 0.0.obs;

  var _field = Field().obs;

  Set<Circle> circles;

  setCircles({@required double lat, @required double long}) {
    circles = Set.from([
      Circle(
        circleId: CircleId('1'),
        center: LatLng(lat, long),
        radius: sliderValue.value.r,
        fillColor: Colors.blue.withOpacity(0.5),
        strokeColor: Colors.blue.withOpacity(0.1),
      ),
    ]);
    update();
  }

  // setLaLong() {
  //   latitude.value = Get.find<LocationController>().latitude.value;
  //   longitude.value = Get.find<LocationController>().longitude.value;
  // }

  var addToFirestoreLoading = false.obs;

  addFieldToFirestore() async {
    addToFirestoreLoading.value = true;
    _field.value = Field()
      ..siteName = siteController.text
      ..radius = sliderValue.value
      ..field = newFieldController.text
      ..cropType = cropTypeController.text
      ..lat = latitude.value
      ..long = longitude.value;

    if (network.connectionStatus.value == 1 ||
        network.connectionStatus.value == 2) {
      try {
        FirestoreServices _fireStore = FirestoreServices();
        FirebaseAuth _auth = FirebaseAuth.instance;
        GoogleSignIn _google = GoogleSignIn();
        var user = _auth.currentUser;

        await _fireStore.addMeetingHistoryToFirestore(
          fieldModel: _field.value.toMap(),
        );

        Get.off(() => SitesPage());

        addToFirestoreLoading.value = false;
      } catch (e) {
        Logger().d(e.toString());
      }
    } else {
      Get.to(NoInternetConnection());
    }

    addToFirestoreLoading.value = false;
  }

  @override
  void onInit() {
    // setLaLong();
    setCircles(lat: latitude.value, long: longitude.value);
    super.onInit();
  }

  @override
  void dispose() {
    siteController.dispose();
    newFieldController.dispose();
    cropTypeController.dispose();
    super.dispose();
  }
}
