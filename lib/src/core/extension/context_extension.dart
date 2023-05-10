import 'package:flutter/cupertino.dart';

extension AppContextExt on BuildContext {
  /// max screen width
  double get maxWidth => MediaQuery.of(this).size.width;

  /// max screen height
  double get maxHeight => MediaQuery.of(this).size.height;
}
