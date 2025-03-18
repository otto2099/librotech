import 'package:hive/hive.dart';
import 'package:librotech/src/core/database/collections_name.dart';

abstract class SearchHistoryLocalDataSource {
  Future<void> addSearchTerm(String searchTerm);
  Future<List<String>> getSearchHistory();
  Future<void> clearSearchHistory();
}

class SearchHistoryLocalDataSourceImpl implements SearchHistoryLocalDataSource {
  @override
  Future<void> addSearchTerm(String searchTerm) async {
    var searchBox = Hive.box(Collections.searchHistory);
    if (searchTerm.trim().isEmpty) return;

    final existingIndex = searchBox.values.toList().indexOf(searchTerm);
    if (existingIndex != -1) {
      await searchBox.deleteAt(existingIndex);
    }

    await searchBox.add(searchTerm);
    while (searchBox.length > 5) {
      await searchBox.deleteAt(0);
    }
  }

  @override
  Future<void> clearSearchHistory() async {
    var box = Hive.box<String>(Collections.searchHistory);
    box.clear();
  }

  @override
  Future<List<String>> getSearchHistory() async {
    var box = Hive.box(Collections.searchHistory);
    List<String> values = box.values.cast<String>().toList().reversed.toList();
    return values;
  }
}
