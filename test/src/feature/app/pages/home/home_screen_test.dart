import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:librotech/src/core/usecases/use_cases.dart';
import 'package:librotech/src/features/app/pages/home/home_controller.dart';
import 'package:librotech/src/features/app/pages/home/home_screen.dart';
import 'package:librotech/src/features/domain/entities/book_entity.dart';
import 'package:librotech/src/features/domain/usecases/get_new_books_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/get_search_history_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/search_books_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/get_book_details_use_cases.dart';
import 'package:card_loading/card_loading.dart';
import 'package:mocktail/mocktail.dart';
import 'package:librotech/src/features/domain/entities/book_pagination_entity.dart';
import 'package:dartz/dartz.dart';

class MockGetBookDetailsUseCase extends Mock implements GetBookDetailsUseCase {}

class MockGetNewBooksUseCase extends Mock implements GetNewBooksUseCase {}

class MockSearchBooksUseCase extends Mock implements SearchBooksUseCase {}

class MockGetSearchHistoryUseCase extends Mock
    implements GetSearchHistoryUseCase {}

void main() {
  late HomeController homeController;
  late MockGetBookDetailsUseCase mockGetBookDetailsUseCase;
  late MockGetNewBooksUseCase mockGetNewBooksUseCase;
  late MockSearchBooksUseCase mockSearchBooksUseCase;
  late MockGetSearchHistoryUseCase mockGetSearchHistoryUseCase;

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

    Get.put<HomeController>(homeController);
  });

  testWidgets(
      'Debe mostrar el historial de búsqueda cuando se presiona el botón de historial',
      (WidgetTester tester) async {
    final fakeHistory = ['Flutter', 'Dart', 'MongoDB'];

    final List<BookEntity> fakeBooks = [
      const BookEntity(
        title: 'Clean Code',
        subtitle: 'A Handbook of Agile Software Craftsmanship',
        isbn13: '9780132350884',
        price: '\$39.99',
        image: 'https://itbook.store/img/books/9781617294136.png',
        url: 'https://fakeurl.com/cleancode',
      ),
      const BookEntity(
        title: 'The Pragmatic Programmer',
        subtitle: 'Your Journey To Mastery',
        isbn13: '9780135957059',
        price: '\$49.99',
        image: 'https://itbook.store/img/books/9781617294136.png',
        url: 'https://fakeurl.com/pragmatic',
      ),
      const BookEntity(
        title: 'Design Patterns',
        subtitle: 'Elements of Reusable Object-Oriented Software',
        isbn13: '9780201633610',
        price: '\$45.99',
        image: 'https://itbook.store/img/books/9781617294136.png',
        url: 'https://fakeurl.com/designpatterns',
      ),
    ];

    when(() => mockGetNewBooksUseCase.call(NoParams())).thenAnswer(
      (_) async => Right(BookPaginationEntity(
        error: '1',
        total: '3',
        page: '1',
        books: fakeBooks,
      )),
    );

    when(() => mockGetSearchHistoryUseCase.call(NoParams())).thenAnswer(
      (_) async => Right(fakeHistory),
    );

    when(() => homeController.getNewBooksUseCase());

    await tester.pumpWidget(
      const GetMaterialApp(
        home: HomeScreen(),
      ),
    );

    final historyButton = find.byIcon(Icons.history_sharp);
    expect(historyButton, findsOneWidget);
    await tester.tap(historyButton);
    await tester.pumpAndSettle();
  });

  testWidgets('Handles empty book list correctly', (WidgetTester tester) async {
    when(() => mockGetNewBooksUseCase.call(NoParams()))
        .thenAnswer((_) async => Right(BookPaginationEntity(books: [])));

    await tester.pumpWidget(
      const GetMaterialApp(
        home: HomeScreen(),
      ),
    );
    await tester.pump();

    expect(find.byType(CardLoading), findsOneWidget);
  });

  testWidgets('Handles empty book list correctly', (WidgetTester tester) async {
    when(() => mockGetNewBooksUseCase.call(NoParams()))
        .thenAnswer((_) async => Right(BookPaginationEntity(books: [])));

    await tester.pumpWidget(
      const GetMaterialApp(
        home: HomeScreen(),
      ),
    );
    await tester.pump();

    expect(find.byType(CardLoading), findsOneWidget);
  });
}
