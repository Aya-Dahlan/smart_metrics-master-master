import 'package:smart_metrics/models/Weather.dart';
import 'package:smart_metrics/models/location.dart.dart';

class WeatherResponse {


  Weather weather ;
  Location location ;



  WeatherResponse.fromJson(Map<String , dynamic> json) {
    weather = Weather.fromJson(json['current']) ;
    location = Location.fromJson(json['location']) ;

  }


}