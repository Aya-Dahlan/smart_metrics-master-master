import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:smart_metrics/Responses/WeatherResponse.dart';
import 'package:smart_metrics/controllers/LocationController.dart';
import 'package:smart_metrics/models/Weather.dart';
import 'package:smart_metrics/services/WeatherApi.dart';

import '../models/location.dart.dart';

class WeatherController extends GetxController {
  var loading = false.obs;

  var weather = Weather().obs;
  var locationModel = Location().obs;

  LocationController location = LocationController();

  Future<void> getCurrentWeatherByLatLong(
      {@required double lat, @required double long}) async {
    loading.value = true;
    try {
      var response =
          await WeatherApi.geCurrentWeatherLatLong(lat: lat, long: long);
      Logger().d(response.data);
      var weatherResponse = WeatherResponse.fromJson(response.data);
      weather.value = weatherResponse.weather;
      locationModel.value = weatherResponse.location;
      update(['getCurrentWeatherByLatLong']);

      // Logger().i(weather.value.cloud) ;
    } catch (e) {
      Logger().d(e.toString());
    }

    loading.value = false;

  }

  Future<void> getCurrentWeatherCurrentLocation() async {
    loading.value = true;
    try {
      var response = await WeatherApi.geCurrentWeatherLatLong(
          lat: location.latitude.value, long: location.longitude.value);
      var weatherResponse = WeatherResponse.fromJson(response.data);
      weather.value = weatherResponse.weather;
      update();
    } catch (e) {
      Logger().d(e.toString());
    }
    loading.value = false;
  }

  @override
  void onInit() {
    // getCurrentWeatherCurrentLocation() ;
    super.onInit();
  }
}
