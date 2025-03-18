import 'package:get/get.dart';
import 'package:librotech/injection_container.dart';
import 'package:librotech/src/features/app/pages/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        getBookDetailsUseCase: sl(),
        getNewBooksUseCase: sl(),
        searchBooksUseCase: sl(),
      ),
    );
  }
}
