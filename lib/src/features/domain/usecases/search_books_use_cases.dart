import 'package:dartz/dartz.dart';
import 'package:librotech/src/core/error/failures.dart';
import 'package:librotech/src/core/usecases/use_cases.dart';
import 'package:librotech/src/features/data/DTOs/search_dto.dart';
import 'package:librotech/src/features/domain/entities/book_pagination_entity.dart';
import 'package:librotech/src/features/domain/repositories/book_repository.dart';

class SearchBooksUseCase implements UseCase<BookPaginationEntity?, SearchDTO> {
  late BookRepository repository;
  SearchBooksUseCase(this.repository);
  @override
  Future<Either<Failure, BookPaginationEntity?>> call(SearchDTO params) async {
    return await repository.searchBooks(params);
  }
}
