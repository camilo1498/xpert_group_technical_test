import 'package:hive/hive.dart';
import 'package:xpert_goup_tecnical_test/src/data/models/history_model.dart';

class LocalStorage {
  /// instances
  final Box<HistoryModel> _localStorage = Hive.box('local_storage');

  addItem({required HistoryModel data}) {
    _localStorage.add(data);
  }

  List<HistoryModel> getItems() {
    if (_localStorage.values.isNotEmpty) {
      List<HistoryModel> localList = [];
      for (HistoryModel item in _localStorage.values) {
        localList.add(item);
      }
      return localList;
    } else {
      return [];
    }
  }

  deleteByIndex({required int index}) {
    _localStorage.deleteAt(index);
  }

  Future deleteAllItems() async {
    return await _localStorage.deleteAll(_localStorage.keys);
  }
}
