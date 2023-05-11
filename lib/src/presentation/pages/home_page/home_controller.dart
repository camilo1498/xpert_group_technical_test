import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/data/source/api_source/data_post_service.dart';

class HomeController extends GetxController {
  /// instances
  final DataPostService _dataPostService = DataPostService();

  /// variables
  bool validateUrl = false;
  bool generatingURL = false;
  String shortenUrl = '';

  /// controllers
  TextEditingController urlController = TextEditingController();

  /// focus
  FocusNode urlNode = FocusNode();

  @override
  void onInit() {
    /// listen text changes
    urlController.addListener(() {
      if (urlController.text.trim().isURL) {
        validateUrl = true;
        update(['validate']);
      } else {
        validateUrl = false;
        update(['validate']);
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    urlController.dispose();
    super.onClose();
  }

  /// on tap methods
  onTapClearIcon() {
    urlController.clear();
  }
}
