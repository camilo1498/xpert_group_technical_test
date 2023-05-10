import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/home_page/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) => Scaffold());
  }
}
