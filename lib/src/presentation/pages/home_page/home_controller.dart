import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/app_utils_global.dart';
import 'package:xpert_goup_tecnical_test/src/data/models/history_model.dart';
import 'package:xpert_goup_tecnical_test/src/data/services/save_widget_as_image.dart';
import 'package:xpert_goup_tecnical_test/src/data/source/api_source/data_post_service.dart';
import 'package:xpert_goup_tecnical_test/src/data/source/local_source/local_storage.dart';

class HomeController extends GetxController {
  /// instances
  final DataPostService _dataPostService = DataPostService();
  final LocalStorage _localStorage = LocalStorage();

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
          _localStorage.addItem(
              data: HistoryModel(url: res['data'], createdAt: DateTime.now()));
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

  onTapShareButton({required GlobalKey qrKey}) async {
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
