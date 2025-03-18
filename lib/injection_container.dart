import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:librotech/src/features/app/pages/book_detail/book_detail_controller.dart';
import 'package:librotech/src/features/app/pages/home/home_controller.dart';

import 'package:librotech/src/features/data/datasource/book_remote_data_source.dart';
import 'package:librotech/src/features/data/repositories/book_repository_impl.dart';
import 'package:librotech/src/features/domain/repositories/book_repository.dart';
import 'package:librotech/src/features/domain/usecases/get_book_details_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/get_new_books_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/search_books_use_cases.dart';

import 'src/core/database/collections_name.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => HomeController(),
  );

  sl.registerFactory(
    () => BookDetailController(),
  );

  // Use cases
  sl.registerLazySingleton(() => GetBookDetailsUseCase(sl()));

  sl.registerLazySingleton(() => GetNewBooksUseCase(sl()));

  sl.registerLazySingleton(() => SearchBooksUseCase(sl()));

  sl.registerLazySingleton<BookRepository>(
    () => BookRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<BookRemoteDataSource>(
      () => BookRemoteDataSourceImpl());

  // External BD
  await Hive.initFlutter();

  // Open Box
  await Hive.openBox(Collections.searchHistory);
}
