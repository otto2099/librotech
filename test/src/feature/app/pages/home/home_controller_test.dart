import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:librotech/src/core/error/failures.dart';
import 'package:librotech/src/core/usecases/use_cases.dart';
import 'package:librotech/src/features/app/pages/home/home_controller.dart';
import 'package:librotech/src/features/domain/usecases/get_book_details_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/get_new_books_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/get_search_history_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/search_books_use_cases.dart';
import 'package:mocktail/mocktail.dart';

// Casos de uso mockeados
class MockGetBookDetailsUseCase extends Mock implements GetBookDetailsUseCase {}

class MockGetNewBooksUseCase extends Mock implements GetNewBooksUseCase {}

class MockSearchBooksUseCase extends Mock implements SearchBooksUseCase {}

class MockGetSearchHistoryUseCase extends Mock
    implements GetSearchHistoryUseCase {}

void main() {
  late MockGetBookDetailsUseCase mockGetBookDetailsUseCase;
  late MockGetNewBooksUseCase mockGetNewBooksUseCase;
  late MockSearchBooksUseCase mockSearchBooksUseCase;
  late MockGetSearchHistoryUseCase mockGetSearchHistoryUseCase;
  late HomeController homeController;

  setUp(() {
    mockGetBookDetailsUseCase = MockGetBookDetailsUseCase();
    mockGetNewBooksUseCase = MockGetNewBooksUseCase();
    mockSearchBooksUseCase = MockSearchBooksUseCase();
    mockGetSearchHistoryUseCase = MockGetSearchHistoryUseCase();

    homeController = HomeController(
      getBookDetailsUseCase: mockGetBookDetailsUseCase,
      getNewBooksUseCase: mockGetNewBooksUseCase,
      searchBooksUseCase: mockSearchBooksUseCase,
      getSearchHistoryUseCase: mockGetSearchHistoryUseCase,
    );
  });

  test('getBookDetailsUseCase maneja errores correctamente', () async {
    when(() => mockGetBookDetailsUseCase.call(any()))
        .thenAnswer((_) async => Left(ServerFailure()));

    await homeController.getBookDetailsUseCase('invalid-id');

    expect(homeController.bookDetailsEntity, isNull);
    verify(() => mockGetBookDetailsUseCase.call(any())).called(1);
  });

  test('getNewBooksUseCase maneja errores correctamente', () async {
    when(() => mockGetNewBooksUseCase.call(NoParams()))
        .thenAnswer((_) async => Left(ServerFailure()));

    await homeController.getNewBooksUseCase();

    expect(homeController.bookList, isNull);
    verify(() => mockGetNewBooksUseCase.call(NoParams())).called(1);
  });

  test('getSearchHistory maneja errores correctamente', () async {
    when(() => mockGetSearchHistoryUseCase.call(NoParams()))
        .thenAnswer((_) async => Left(CacheFailure()));

    await homeController.getSearchHistory();

    expect(homeController.searchHistory, isNull);
    verify(() => mockGetSearchHistoryUseCase.call(NoParams())).called(1);
  });
}
