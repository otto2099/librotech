import 'package:dartz/dartz.dart';
import 'package:librotech/src/core/error/failures.dart';
import 'package:librotech/src/core/usecases/use_cases.dart';
import 'package:librotech/src/features/domain/entities/book_detail_entity.dart';
import 'package:librotech/src/features/domain/repositories/book_repository.dart';

class GetBookDetailsUseCase implements UseCase<BookDetailsEntity?, String> {
  late BookRepository repository;
  GetBookDetailsUseCase(this.repository);
  @override
  Future<Either<Failure, BookDetailsEntity?>> call(String params) async {
    return await repository.getBookDetails(params);
  }
}
