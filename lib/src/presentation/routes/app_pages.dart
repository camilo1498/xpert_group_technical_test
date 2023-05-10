import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/home_page/home_controller.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/home_page/home_page.dart';
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
          name: AppRoutes.homePage,
          page: () => const HomePage(),
          binding: BindingsBuilder(
            () => Get.lazyPut(() => HomeController()),
          ),
        ),
      ];
}
