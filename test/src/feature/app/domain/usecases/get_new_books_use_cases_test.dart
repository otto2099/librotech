import 'package:flutter_test/flutter_test.dart';
import 'package:librotech/src/features/domain/entities/book_entity.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:librotech/src/core/error/failures.dart';
import 'package:librotech/src/core/usecases/use_cases.dart';
import 'package:librotech/src/features/domain/entities/book_pagination_entity.dart';
import 'package:librotech/src/features/domain/repositories/book_repository.dart';
import 'package:librotech/src/features/domain/usecases/get_new_books_use_cases.dart';

// Mock class for BookRepository
class MockBookRepository extends Mock implements BookRepository {}

void main() {
  late GetNewBooksUseCase useCase;
  late MockBookRepository mockRepository;

  setUp(() {
    mockRepository = MockBookRepository();
    useCase = GetNewBooksUseCase(mockRepository);
  });

  const tBookPagination = BookPaginationEntity(
    error: null,
    total: "10",
    page: "1",
    books: [
      BookEntity(
        title: 'Test Title',
        subtitle: 'Test Subtitle',
        isbn13: '1234567890123',
        price: '\$25.00',
        image: 'https://example.com/image.jpg',
        url: 'https://example.com',
      )
    ],
  );

  test('should return BookPaginationEntity when repository call is successful',
      () async {
    when(() => mockRepository.getNewBooks())
        .thenAnswer((_) async => Right(tBookPagination));

    final result = await useCase(NoParams());

    expect(result, Right(tBookPagination));
    verify(() => mockRepository.getNewBooks()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a Failure when repository call fails', () async {
    final tFailure = ServerFailure();
    when(() => mockRepository.getNewBooks())
        .thenAnswer((_) async => Left(tFailure));

    final result = await useCase(NoParams());

    expect(result, Left(tFailure));
    verify(() => mockRepository.getNewBooks()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
