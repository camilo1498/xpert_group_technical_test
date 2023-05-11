import 'package:flutter/cupertino.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/app_colors_global.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/global_app_font.dart';

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
}
