import 'package:hive/hive.dart';
import 'package:librotech/src/core/database/collections_name.dart';

abstract class SearchHistoryLocalDataSource {
  Future<void> addSearchTerm(String searchTerm);
  Future<List<String>> getSearchHistory();
  Future<void> clearSearchHistory();
}

class SearchHistoryLocalDataSourceImpl extends SearchHistoryLocalDataSource {
  static const String _boxName = Collections.searchHistory;
  @override
  Future<void> addSearchTerm(String searchTerm) async {
    var box = Hive.box<String>(_boxName);
    final existingIndex = box.values.toList().indexOf(searchTerm);
    if (existingIndex != -1) {
      await box.deleteAt(existingIndex);
    }
    await box.add(searchTerm);
    while (box.length > 5) {
      await box.deleteAt(0);
    }
  }

  @override
  Future<void> clearSearchHistory() async {
    var box = Hive.box<String>(_boxName);
    box.clear();
  }

  @override
  Future<List<String>> getSearchHistory() async {
    var box = Hive.box<String>(_boxName);
    return box.values.toList().reversed.toList();
  }
}
