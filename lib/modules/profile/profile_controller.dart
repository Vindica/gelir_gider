import 'package:gelir_gider_app/core/base_controller.dart';
import 'package:gelir_gider_app/models/app_user.dart';
import 'package:gelir_gider_app/services/auth_service.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class ProfileController extends BaseController {
  final AuthService _authService = Get.find<AuthService>();
  Rx<AppUser?> get user => _authService.currentUser;
}
