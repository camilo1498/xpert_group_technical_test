import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/splash_screen/splash_screen_controller.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(builder: (ctrl) => Scaffold());
  }
}
