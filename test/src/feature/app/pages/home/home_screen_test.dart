import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:librotech/src/core/usecases/use_cases.dart';
import 'package:librotech/src/features/app/pages/home/home_controller.dart';
import 'package:librotech/src/features/app/pages/home/home_screen.dart';
import 'package:librotech/src/features/domain/usecases/get_new_books_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/search_books_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/get_book_details_use_cases.dart';
import 'package:card_loading/card_loading.dart';
import 'package:mocktail/mocktail.dart';
import 'package:librotech/src/features/domain/entities/book_pagination_entity.dart';
import 'package:dartz/dartz.dart';

class MockGetBookDetailsUseCase extends Mock implements GetBookDetailsUseCase {}

class MockGetNewBooksUseCase extends Mock implements GetNewBooksUseCase {}

class MockSearchBooksUseCase extends Mock implements SearchBooksUseCase {}

void main() {
  late HomeController homeController;
  late MockGetBookDetailsUseCase mockGetBookDetailsUseCase;
  late MockGetNewBooksUseCase mockGetNewBooksUseCase;
  late MockSearchBooksUseCase mockSearchBooksUseCase;

  setUp(() {
    mockGetBookDetailsUseCase = MockGetBookDetailsUseCase();
    mockGetNewBooksUseCase = MockGetNewBooksUseCase();
    mockSearchBooksUseCase = MockSearchBooksUseCase();

    homeController = HomeController(
      getBookDetailsUseCase: mockGetBookDetailsUseCase,
      getNewBooksUseCase: mockGetNewBooksUseCase,
      searchBooksUseCase: mockSearchBooksUseCase,
    );

    Get.put<HomeController>(homeController);
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
