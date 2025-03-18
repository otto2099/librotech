import 'package:dartz/dartz.dart';
import 'package:librotech/src/core/error/failures.dart';
import 'package:librotech/src/core/usecases/use_cases.dart';
import 'package:librotech/src/features/domain/entities/book_pagination_entity.dart';
import 'package:librotech/src/features/domain/repositories/book_repository.dart';

class GetNewBooksUseCase implements UseCase<BookPaginationEntity?, NoParams> {
  late BookRepository repository;
  GetNewBooksUseCase(this.repository);
  @override
  Future<Either<Failure, BookPaginationEntity?>> call(NoParams params) async {
    return await repository.getNewBooks();
  }
}
