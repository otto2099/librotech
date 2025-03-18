import 'package:get/get.dart';
import 'package:librotech/src/features/domain/entities/book_detail_entity.dart';
import 'package:librotech/src/features/domain/usecases/get_book_details_use_cases.dart';

class BookDetailController extends GetxController {
  final GetBookDetailsUseCase _getBookDetailsUseCase;

  BookDetailsEntity? bookDetailsEntity;

  BookDetailController({
    GetBookDetailsUseCase? getBookDetailsUseCase,
  }) : _getBookDetailsUseCase = getBookDetailsUseCase!;

  Future<void> getBookDetailsUseCase(String id) async {
    final res = await _getBookDetailsUseCase.call(id);
    res.fold(
      (l) {},
      (r) {
        bookDetailsEntity = r;
        update(["BookDetail"]);
      },
    );
  }
}
