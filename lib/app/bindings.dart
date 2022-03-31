import 'package:get/get.dart';
import 'package:smart_metrics/controllers/AuthController.dart';
import 'package:smart_metrics/controllers/NetworkController.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController()) ;
    // Get.put(NetworkController()) ;
  }




}