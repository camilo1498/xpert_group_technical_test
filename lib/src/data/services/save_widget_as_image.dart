import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

class SaveWidgetImage {
  static Future<String> takePicture({required contentKey}) async {
    try {
      /// converter widget to image
      RenderRepaintBoundary boundary =
          contentKey.currentContext.findRenderObject();

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);

      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      /// create file
      final String dir = (await getApplicationDocumentsDirectory()).path;
      String imagePath = '$dir/shortener${DateTime.now()}.png';
      File capturedFile = File(imagePath);
      await capturedFile.writeAsBytes(pngBytes);

      return imagePath;
    } catch (e) {
      debugPrint('exception => $e');
      return '';
    }
  }
}
