import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/routes/app_routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    /// wait two seconds and then go to home page
    await 2.seconds.delay();
    Get.offNamed(AppRoutes.mainPage);
    super.onInit();
  }
}
