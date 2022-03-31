import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as GET;
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smart_metrics/utils/constant_endpoints.dart';

class WeatherApi {
  static final dio = Dio(BaseOptions(
    baseUrl: WeatherApiEndPoints.baseUrl,
    receiveDataWhenStatusError: true,
  ));

  static void initializeInterceptor() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) async {
        var token = await GetStorage().read('login_token');
        var headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token'
        };
        request.headers.addAll(headers);

        dio.interceptors.add(PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            request: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90));

        return handler.next(request);
      },
      onResponse: (response, handler) {
        print('${response.data}');
        if (response.data['error'] == 1) throw response.data['message'];

        return handler.next(response);
      },
      onError: (error, handler) {
        if (GET.Get.isDialogOpen == true) {
          GET.Get.back();
        }

        GET.Get.snackbar('error', '${error.message}',
            snackPosition: GET.SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      },
    ));
  }

  static Future<Response> geCurrentWeatherLatLong(
      {@required double lat, @required double long}) async {
    return dio.get(
        '/current.json?key=${WeatherApiEndPoints.apiKey} &q=${lat.toString()},${long.toString()}');
  }
}
