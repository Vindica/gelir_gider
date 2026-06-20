import 'package:gelir_gider_app/modules/home/home_bindings.dart';
import 'package:gelir_gider_app/modules/home/home_page.dart';
import 'package:gelir_gider_app/modules/login/login_bindings.dart';
import 'package:gelir_gider_app/modules/login/login_page.dart';
import 'package:gelir_gider_app/modules/splash/splash_bindings.dart';
import 'package:gelir_gider_app/modules/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class AppRoutes {
  static const initial = splash;
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
  static const profile = '/profile';
}

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
