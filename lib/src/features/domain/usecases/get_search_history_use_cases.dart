import 'package:dartz/dartz.dart';
import 'package:librotech/src/core/error/failures.dart';
import 'package:librotech/src/core/usecases/use_cases.dart';
import 'package:librotech/src/features/domain/repositories/book_repository.dart';

class GetSearchHistoryUseCase implements UseCase<List<String>?, NoParams> {
  late BookRepository repository;
  GetSearchHistoryUseCase(this.repository);
  @override
  Future<Either<Failure, List<String>?>> call(NoParams noParams) async {
    return await repository.getSearchHistory();
  }
}
