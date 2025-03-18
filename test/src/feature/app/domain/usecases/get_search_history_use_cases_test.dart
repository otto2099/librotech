import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:librotech/src/core/usecases/use_cases.dart';
import 'package:librotech/src/features/domain/repositories/book_repository.dart';
import 'package:librotech/src/features/domain/usecases/get_search_history_use_cases.dart';
import 'package:mocktail/mocktail.dart';

// Mock del repositorio
class MockBookRepository extends Mock implements BookRepository {}

void main() {
  late GetSearchHistoryUseCase getSearchHistoryUseCase;
  late MockBookRepository mockBookRepository;

  setUp(() {
    mockBookRepository = MockBookRepository();
    getSearchHistoryUseCase = GetSearchHistoryUseCase(mockBookRepository);
  });

  test('Debe devolver una lista de historial de búsqueda en caso de éxito',
      () async {
    final fakeHistory = ['Flutter', 'Dart', 'MongoDB'];

    when(() => mockBookRepository.getSearchHistory())
        .thenAnswer((_) async => Right(fakeHistory));

    final result = await getSearchHistoryUseCase(NoParams());

    expect(result, Right(fakeHistory));
    verify(() => mockBookRepository.getSearchHistory()).called(1);
  });
}
