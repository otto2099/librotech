import 'package:get/get.dart';
import 'package:librotech/injection_container.dart';
import 'package:librotech/src/features/app/pages/book_detail/book_detail_controller.dart';

class BookDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BookDetailController(
        getBookDetailsUseCase: sl(),
      ),
    );
  }
}
