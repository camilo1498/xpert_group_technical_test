import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/app_colors_global.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/app_global_asset.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/splash_screen/splash_screen_controller.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
        builder: (ctrl) => Scaffold(
              backgroundColor: AppColor.background,
              body: Center(
                child: SizedBox(
                    width: 300.w,
                    height: 300.w,
                    child: Image.asset(
                      AppGlobalAsset.appIcon,
                    )),
              ),
            ));
  }
}
