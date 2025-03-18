import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:librotech/src/features/app/pages/book_detail/book_detail_controller.dart';
import 'package:librotech/src/features/domain/entities/book_detail_entity.dart';
import 'package:librotech/src/features/domain/usecases/get_book_details_use_cases.dart';
import 'package:mocktail/mocktail.dart';

// Se crea una clase mock para el use case
class MockGetBookDetailsUseCase extends Mock implements GetBookDetailsUseCase {}

void main() {
  late MockGetBookDetailsUseCase mockGetBookDetailsUseCase;
  late BookDetailController controller;

  setUp(() {
    mockGetBookDetailsUseCase = MockGetBookDetailsUseCase();
    controller =
        BookDetailController(getBookDetailsUseCase: mockGetBookDetailsUseCase);
  });

  group('BookDetailController - getBookDetailsUseCase', () {
    const tBookId = '123';

    const BookDetailsEntity dummyBookDetail = BookDetailsEntity(
      title: 'Test Title',
      subtitle: 'Test Subtitle',
      authors: 'Test Author',
      publisher: 'Test Publisher',
      isbn10: '1234567890',
      isbn13: '1234567890123',
      pages: '200',
      year: '2020',
      rating: '4.0',
      desc: 'Test Description',
      price: '\$20',
      image: 'http://example.com/image.png',
      url: 'http://example.com',
      pdf: null,
    );

    test('debe asignar bookDetailsEntity cuando el use case retorna Right',
        () async {
      when(() => mockGetBookDetailsUseCase.call(tBookId))
          .thenAnswer((_) async => Right(dummyBookDetail));

      await controller.getBookDetailsUseCase(tBookId);

      expect(controller.bookDetailsEntity, equals(dummyBookDetail));
      verify(() => mockGetBookDetailsUseCase.call(tBookId)).called(1);
    });
  });
}
