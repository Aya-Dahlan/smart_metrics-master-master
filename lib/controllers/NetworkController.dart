import 'dart:async';

import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

// pub.dev connectivity: ^3.0.6


class NetworkController extends GetxController {
  var connectionStatus = 0.obs;

   StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }


  _updateConnectionStatus(ConnectivityResult result) async {
    try {
      result = await Connectivity().checkConnectivity();
    } catch (e) {
      print(e);
    }
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
