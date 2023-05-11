import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/history_page/history_controller.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/history_page/history_page.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/home_page/home_controller.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/home_page/home_page.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/main/main_controller.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/main/main_page.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/splash_screen/splash_screen_controller.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/splash_screen/splash_screen_page.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/routes/app_routes.dart';

class AppPages {
  static List<GetPage> get appPages => [
        GetPage(
          name: AppRoutes.splashPage,
          page: () => const SplashScreenPage(),
          binding: BindingsBuilder(
            () => Get.lazyPut(() => SplashScreenController()),
          ),
        ),
        GetPage(
          name: AppRoutes.mainPage,
          page: () => const MainPage(),
          binding: BindingsBuilder(
            () => Get.lazyPut(() => MainController()),
          ),
        ),
      ];

  /// nested route navigation
  static Route<dynamic> homePageRoutes(RouteSettings route) {
    Get.routing.args = route.arguments;
    if (route.name != null) Get.routing.current = route.name!;
    switch (route.name) {
      case AppRoutes.homePage:
        return GetPageRoute(
            routeName: AppRoutes.homePage,
            settings: route,
            page: () => const HomePage(),
            binding: BindingsBuilder(() => Get.lazyPut(
                  () => HomeController(),
                )));
      case AppRoutes.historyPage:
        return GetPageRoute(
            routeName: AppRoutes.homePage,
            settings: route,
            page: () => const HistoryPage(),
            binding: BindingsBuilder(() => Get.lazyPut(
                  () => HistoryController(),
                )));

      default:
        return GetPageRoute(
            routeName: AppRoutes.homePage,
            settings: route,
            page: () => const HomePage(),
            binding: BindingsBuilder(() => Get.lazyPut(
                  () => HomeController(),
                )));
    }
  }
}
