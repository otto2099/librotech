import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:librotech/src/core/usecases/use_cases.dart';
import 'package:librotech/src/features/app/pages/home/home_controller.dart';
import 'package:librotech/src/features/data/DTOs/search_dto.dart';
import 'package:librotech/src/features/domain/entities/book_detail_entity.dart';
import 'package:librotech/src/features/domain/entities/book_entity.dart';
import 'package:librotech/src/features/domain/entities/book_pagination_entity.dart';
import 'package:librotech/src/features/domain/usecases/get_book_details_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/get_new_books_use_cases.dart';
import 'package:librotech/src/features/domain/usecases/search_books_use_cases.dart';
import 'package:mocktail/mocktail.dart';

// Se crean clases mock para cada use case.
class MockGetBookDetailsUseCase extends Mock implements GetBookDetailsUseCase {}

class MockGetNewBooksUseCase extends Mock implements GetNewBooksUseCase {}

class MockSearchBooksUseCase extends Mock implements SearchBooksUseCase {}

void main() {
  setUpAll(() {
    registerFallbackValue(SearchDTO(page: '1', query: '1234567890123'));
  });

  late MockGetBookDetailsUseCase mockGetBookDetailsUseCase;
  late MockGetNewBooksUseCase mockGetNewBooksUseCase;
  late MockSearchBooksUseCase mockSearchBooksUseCase;
  late HomeController homeController;

  setUp(() {
    mockGetBookDetailsUseCase = MockGetBookDetailsUseCase();
    mockGetNewBooksUseCase = MockGetNewBooksUseCase();
    mockSearchBooksUseCase = MockSearchBooksUseCase();

    homeController = HomeController(
      getBookDetailsUseCase: mockGetBookDetailsUseCase,
      getNewBooksUseCase: mockGetNewBooksUseCase,
      searchBooksUseCase: mockSearchBooksUseCase,
    );
  });

  group('HomeController', () {
    const tBookId = '9781234567890';

    const dummyBookDetails = BookDetailsEntity(
      title: 'Test Title',
      subtitle: 'Test Subtitle',
      authors: 'Test Author',
      publisher: 'Test Publisher',
      isbn10: '1234567890',
      isbn13: '9781234567890',
      pages: '200',
      year: '2020',
      rating: '4.0',
      desc: 'Test Description',
      price: '\$20',
      image: 'http://example.com/image.png',
      url: 'http://example.com',
      pdf: null,
    );

    const dummyBook = BookEntity(
      title: 'Dummy Book Title',
      subtitle: 'Dummy Subtitle',
      isbn13: '9781234567890',
      price: '\$9.99',
      image: 'http://example.com/dummy_image.png',
      url: 'http://example.com/dummy_url',
    );

    const dummyBookPagination = BookPaginationEntity(
      total: '1',
      page: '1',
      books: [dummyBook],
    );

    test(
        'getBookDetailsUseCase debe actualizar bookDetailsEntity en caso de éxito',
        () async {
      when(() => mockGetBookDetailsUseCase.call(tBookId))
          .thenAnswer((_) async => const Right(dummyBookDetails));

      await homeController.getBookDetailsUseCase(tBookId);

      expect(homeController.bookDetailsEntity, equals(dummyBookDetails));
      verify(() => mockGetBookDetailsUseCase.call(tBookId)).called(1);
    });

    test('getNewBooksUseCase debe actualizar bookList en caso de éxito',
        () async {
      when(() => mockGetNewBooksUseCase.call(NoParams()))
          .thenAnswer((_) async => const Right(dummyBookPagination));

      await homeController.getNewBooksUseCase();

      expect(homeController.bookList, equals(dummyBookPagination));
      verify(() => mockGetNewBooksUseCase.call(NoParams())).called(1);
    });

    test(
        'onClose debe disponer searchController y cancelar debouncer sin arrojar excepción',
        () {
      expect(() => homeController.onClose(), returnsNormally);
    });
  });
}
