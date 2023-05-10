import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/pages/history_page/history_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(builder: (ctrl) => Scaffold());
  }
}
