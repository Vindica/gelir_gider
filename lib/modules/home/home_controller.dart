import 'package:gelir_gider_app/core/base_controller.dart';
import 'package:gelir_gider_app/routes/app_pages.dart';
import 'package:gelir_gider_app/services/auth_service.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class HomeController extends BaseController {
  final currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  Future<void> cikisYap() async {
    await Get.find<AuthService>().signOut();
    Get.offAllNamed(AppRoutes.login);
  }

  void goToTransaction() {
    Get.toNamed(AppRoutes.transaction);
  }
}
