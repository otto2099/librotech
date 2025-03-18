import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librotech/src/core/usecases/use_cases.dart';
import 'package:librotech/src/core/utils/utils.dart';
import 'package:librotech/src/features/data/DTOs/search_dto.dart';
import 'package:librotech/src/features/domain/entities/book_detail_entity.dart';
import 'package:librotech/src/features/domain/entities/book_pagination_entity.dart';
import 'package:librotech/src/features/domain/usecases/get_book_details_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/get_new_books_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/get_search_history_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/search_books_use_cases.dart';

class HomeController extends GetxController {
  var searchController = TextEditingController().obs;

  final GetBookDetailsUseCase _getBookDetailsUseCase;
  final GetNewBooksUseCase _getNewBooksUseCase;
  final SearchBooksUseCase _searchBooksUseCase;
  final GetSearchHistoryUseCase _getSearchHistoryUseCase;

  final debouncer = Debouncer(duration: const Duration(milliseconds: 1500));

  List<String>? searchHistory;
  BookPaginationEntity? bookList;
  BookDetailsEntity? bookDetailsEntity;

  HomeController({
    GetBookDetailsUseCase? getBookDetailsUseCase,
    GetNewBooksUseCase? getNewBooksUseCase,
    SearchBooksUseCase? searchBooksUseCase,
    GetSearchHistoryUseCase? getSearchHistoryUseCase,
  })  : _getBookDetailsUseCase = getBookDetailsUseCase!,
        _getNewBooksUseCase = getNewBooksUseCase!,
        _getSearchHistoryUseCase = getSearchHistoryUseCase!,
        _searchBooksUseCase = searchBooksUseCase!;

  Future<void> getBookDetailsUseCase(String id) async {
    final res = await _getBookDetailsUseCase.call(id);
    res.fold(
      (l) {},
      (r) {
        bookDetailsEntity = r;
        update(["BooksDetail"]);
      },
    );
  }

  Future<void> getNewBooksUseCase() async {
    final res = await _getNewBooksUseCase.call(NoParams());
    res.fold(
      (l) {},
      (r) {
        bookList = r;
        update(["Books"]);
      },
    );
  }

  Future<void> getSearchHistory() async {
    final res = await _getSearchHistoryUseCase.call(NoParams());
    res.fold(
      (l) {},
      (r) {
        searchHistory = r;
        update(["SearchHistory"]);
      },
    );
  }

  Future<void> searchBooksUseCase() async {
    final res = await _searchBooksUseCase
        .call(SearchDTO(page: '1', query: searchController.value.text));
    res.fold(
      (l) {},
      (r) {
        bookList = r;
        update(["Books"]);
      },
    );
  }

  void showSearchHistoryDialog(
      BuildContext context, Function(String) onSelect) async {
    Get.dialog(
      AlertDialog(
        title: const Text("Historial de búsqueda"),
        content: GetBuilder<HomeController>(
          id: "SearchHistory",
          builder: (HomeController controller) {
            if (searchHistory!.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SizedBox(
              width: double.maxFinite,
              child: searchHistory!.isEmpty
                  ? const Center(child: Text("No hay historial de búsqueda"))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchHistory!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(searchHistory![index]),
                          onTap: () {
                            onSelect(searchHistory![index]);
                            Get.back();
                          },
                          leading: IconButton(
                            icon: const Icon(Icons.book),
                            onPressed: () {},
                          ),
                        );
                      },
                    ),
            );
          },
        ),
      ),
    );
  }

  @override
  void onClose() {
    searchController.value.dispose();
    debouncer.cancel();
    super.onClose();
  }
}
