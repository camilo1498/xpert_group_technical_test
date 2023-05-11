import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xpert_goup_tecnical_test/src/core/global/app_utils_global.dart';
import 'package:xpert_goup_tecnical_test/src/data/models/history_model.dart';
import 'package:xpert_goup_tecnical_test/src/data/source/local_source/local_storage.dart';

class HistoryController extends GetxController {
  /// instances
  final LocalStorage _localStorage = LocalStorage();

  /// variables
  List<HistoryModel> historyList = [];

  @override
  void onInit() {
    historyList = _localStorage.getItems();
    print(historyList.length);
    update();
    super.onInit();
  }

  onTapDeleteButton({required int index}) {
    _localStorage.deleteByIndex(index: index);
    historyList = _localStorage.getItems();
    update();
  }

  onTapCopyButton({required int index}) async {
    await Clipboard.setData(ClipboardData(text: historyList[index].url))
        .whenComplete(() {
      AppUtilsGlobal.snackBar(menssage: 'Url copiada');
    });
  }

  onTapDeleteAll() async {
    await _localStorage.deleteAllItems().whenComplete(() {
      historyList = _localStorage.getItems();
      update();
    });
  }
}
