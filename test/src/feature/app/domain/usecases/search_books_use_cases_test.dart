import 'package:flutter_test/flutter_test.dart';
import 'package:librotech/src/features/domain/entities/book_entity.dart';
import 'package:librotech/src/features/domain/usecases/search_books_use_cases.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:librotech/src/core/error/failures.dart';
import 'package:librotech/src/features/data/DTOs/search_dto.dart';
import 'package:librotech/src/features/domain/entities/book_pagination_entity.dart';
import 'package:librotech/src/features/domain/repositories/book_repository.dart';

class MockBookRepository extends Mock implements BookRepository {}

void main() {
  late SearchBooksUseCase useCase;
  late MockBookRepository mockRepository;

  setUp(() {
    mockRepository = MockBookRepository();
    useCase = SearchBooksUseCase(mockRepository);
  });

  final tSearchDTO = SearchDTO(query: "Flutter", page: '1');

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
    when(() => mockRepository.searchBooks(tSearchDTO))
        .thenAnswer((_) async => Right(tBookPagination));

    final result = await useCase(tSearchDTO);

    expect(result, Right(tBookPagination));
    verify(() => mockRepository.searchBooks(tSearchDTO)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a Failure when repository call fails', () async {
    final tFailure = ServerFailure(); // Ensure ServerFailure is defined
    when(() => mockRepository.searchBooks(tSearchDTO))
        .thenAnswer((_) async => Left(tFailure));

    final result = await useCase(tSearchDTO);

    expect(result, Left(tFailure));
    verify(() => mockRepository.searchBooks(tSearchDTO)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
