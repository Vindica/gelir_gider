import 'package:flutter/rendering.dart';
import 'package:gelir_gider_app/core/base_controller.dart';
import 'package:gelir_gider_app/services/api_service.dart';
import 'package:gelir_gider_app/services/storage_service.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  final areServicesReady = false.obs;
  @override
  void onReady() async {
    super.onReady();
    await checkServices();
    areServicesReady.value = true;
  }

  Future<void> checkServices() async {
    while (!Get.isRegistered<StorageService>() &&
        !Get.isRegistered<ApiService>()) {
      await Future.delayed(Duration(seconds: 1));
    }
    var map = Get.find<StorageService>().getAllValues();
    debugPrint(map.toString());
  }
}
