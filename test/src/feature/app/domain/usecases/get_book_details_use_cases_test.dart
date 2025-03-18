import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:librotech/src/core/error/failures.dart';
import 'package:librotech/src/features/domain/entities/book_detail_entity.dart';
import 'package:librotech/src/features/domain/repositories/book_repository.dart';
import 'package:librotech/src/features/domain/usecases/get_book_details_use_cases.dart';

// Mock class for BookRepository
class MockBookRepository extends Mock implements BookRepository {}

void main() {
  late GetBookDetailsUseCase useCase;
  late MockBookRepository mockRepository;

  setUp(() {
    mockRepository = MockBookRepository();
    useCase = GetBookDetailsUseCase(mockRepository);
  });

  const tBookId = "1234567890";

  const tBookDetails = BookDetailsEntity(
    error: null,
    title: "Test Book",
    subtitle: "Test Subtitle",
    authors: "Test Author",
    publisher: "Test Publisher",
    isbn10: "1234567890",
    isbn13: "1234567890123",
    pages: "300",
    year: "2022",
    rating: "4.5",
    desc: "Test Description",
    price: "\$29.99",
    image: "https://example.com/test.jpg",
    url: "https://example.com",
    pdf: null, // Adjust if necessary
  );

  test('should return BookDetailsEntity when repository call is successful',
      () async {
    // Arrange
    when(() => mockRepository.getBookDetails(tBookId))
        .thenAnswer((_) async => const Right(tBookDetails));

    // Act
    final result = await useCase(tBookId);

    // Assert
    expect(result, const Right(tBookDetails));
    verify(() => mockRepository.getBookDetails(tBookId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a Failure when repository call fails', () async {
    // Arrange
    final tFailure = ServerFailure(); // Ensure ServerFailure is defined
    when(() => mockRepository.getBookDetails(tBookId))
        .thenAnswer((_) async => Left(tFailure));

    // Act
    final result = await useCase(tBookId);

    // Assert
    expect(result, Left(tFailure));
    verify(() => mockRepository.getBookDetails(tBookId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
