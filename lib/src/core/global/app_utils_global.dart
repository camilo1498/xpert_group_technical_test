import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/app_colors_global.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/global_app_font.dart';
import 'package:xpert_goup_tecnical_test/src/presentation/widgets/text/text_widget.dart';

class AppUtilsGlobal {
  /// global radius
  static final BorderRadius globalRadius = BorderRadius.circular(10);

  /// global text style
  static TextStyle textStyle({
    AppFont? font,
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppColor.blackHardness,
    double? size,
  }) {
    return TextStyle(
        fontFamily: font != null ? font.family : AppFont.body.family,
        fontWeight: fontWeight,
        color: color,
        fontSize: font != null ? 14 : size ?? font?.size);
  }

  /// overlay message
  static SnackbarController? snackBar({
    String title = "Mensaje!",
    required String menssage,
    int duration = 2,
  }) {
    if (Get.isSnackbarOpen) return null;
    return Get.snackbar(
      title,
      menssage,
      titleText: TextWidget(
        title,
        color: AppColor.whiteSnow,
        font: AppFont.h3,
        fontWeight: FontWeight.bold,
      ),
      messageText: TextWidget(
        menssage,
        color: AppColor.whiteSnow,
        font: AppFont.bodyBold,
      ),
      backgroundColor: AppColor.blackHardness.withOpacity(.75),
      duration: Duration(seconds: duration),
    );
  }
}
