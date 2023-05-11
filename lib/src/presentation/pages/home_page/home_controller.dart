import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/app_utils_global.dart';
import 'package:xpert_goup_tecnical_test/src/data/services/save_widget_as_image.dart';
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

  /// keys
  final GlobalKey qrKey = GlobalKey();

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
    /// close text controller
    urlController.dispose();
    super.onClose();
  }

  /// fetch methods
  generateUrl() async {
    if (validateUrl) {
      /// start loading
      generatingURL = true;
      shortenUrl = '';
      update(['validate', 'shorten_url']);

      /// send request
      await _dataPostService
          .generateUrl(url: urlController.text.trim())
          .then((res) {
        /// set success url
        if (res['success'] == true) {
          shortenUrl = res['data'];
        } else {
          /// show error message
          shortenUrl = '';
          AppUtilsGlobal.snackBar(menssage: res['message']);
        }
      }).whenComplete(() {
        /// stop loading
        generatingURL = false;
        update(['validate', 'shorten_url']);
      });
    } else {
      /// show validation message
      AppUtilsGlobal.snackBar(menssage: 'Debes ingresar una URL valida');
    }
  }

  /// on tap methods
  onTapClearIcon() {
    /// clear text field
    urlController.clear();
    shortenUrl = '';
    update(['shorten_url']);
  }

  onTapShareButton() async {
    String res = await SaveWidgetImage.takePicture(contentKey: qrKey);
    if (res.isNotEmpty) {
      Share.shareXFiles([XFile(res)], text: shortenUrl);
    } else {
      Share.share(shortenUrl, subject: 'Ingresa a mi URL acortada!');
    }
  }

  onTapCopyButton() async {
    await Clipboard.setData(ClipboardData(text: shortenUrl)).whenComplete(() {
      AppUtilsGlobal.snackBar(menssage: 'Url copiada');
    });
  }
}
