import 'package:get/get.dart';
import 'package:librotech/src/features/app/pages/book_detail/book_detail_binding.dart';
import 'package:librotech/src/features/app/pages/book_detail/book_detail_screen.dart';
import 'package:librotech/src/features/app/pages/home/home_binding.dart';
import 'package:librotech/src/features/app/pages/home/home_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: BookDetailScreen.routeName,
      page: () => const BookDetailScreen(),
      binding: BookDetailBinding(),
      parameters: const {'id': ''},
    ),
  ];
}
