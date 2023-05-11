import 'package:get/get.dart';

class MainController extends GetxController {
  /// variables
  int selectItemBottomNav = 0;

  /// on tap methods
  void nextPage({required int indexPag, required String route}) async {
    if (selectItemBottomNav == indexPag) return;
    selectItemBottomNav = indexPag;
    update(['bottom_bar']);
    return Get.offNamed(route, id: 0);
  }
}
