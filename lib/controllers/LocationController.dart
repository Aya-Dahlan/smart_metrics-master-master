import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:smart_metrics/Responses/WeatherResponse.dart';
import 'package:smart_metrics/services/LocationServices.dart';
import 'package:smart_metrics/services/WeatherApi.dart';

import '../models/Weather.dart';
import 'WeatherModel.dart';

class LocationController extends GetxController {
  LocationServices _locationServices = LocationServices();

  var latitude = 0.0.obs;

  var longitude = 0.0.obs;

  var address = ''.obs;

  getGetLocationAddress() async {
    Placemark place;
    Position position;
    position = await _locationServices.getGeoLocationPosition();
    place = await _locationServices.getAddressFromLatLong(position);
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    address.value =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    Logger().i("address :" + address.value);
  }

  var weather = Weather().obs;

  getWeatherByLatLong({@required double lat, @required double long}) async {
    try {
      var response =
          await WeatherApi.geCurrentWeatherLatLong(lat: lat, long: long);
      var weatherResponse = WeatherResponse.fromJson(response.data);
      weather.value = weatherResponse.weather;
    } catch (e) {
      Logger().i(e.toString()) ;
    }
  }

  @override
  void onInit() {
    _locationServices = LocationServices();
    getGetLocationAddress();
    super.onInit();
  }
}
