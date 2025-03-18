import 'package:dartz/dartz.dart';
import 'package:librotech/src/core/error/failures.dart';
import 'package:librotech/src/features/data/DTOs/search_dto.dart';
import 'package:librotech/src/features/data/datasource/book_remote_data_source.dart';
import 'package:librotech/src/features/data/datasource/search_history_local_data_source.dart';
import 'package:librotech/src/features/domain/entities/book_detail_entity.dart';
import 'package:librotech/src/features/domain/entities/book_pagination_entity.dart';
import 'package:librotech/src/features/domain/repositories/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource _remoteDataSource;
  final SearchHistoryLocalDataSource _localDataSource;

  BookRepositoryImpl({
    required BookRemoteDataSource? remoteDataSource,
    SearchHistoryLocalDataSource? localDataSource,
  })  : assert(remoteDataSource != null),
        assert(localDataSource != null),
        _remoteDataSource = remoteDataSource!,
        _localDataSource = localDataSource!;

  @override
  Future<Either<Failure, BookDetailsEntity>> getBookDetails(String id) async {
    try {
      final res = await _remoteDataSource.getBookDetails(id);

      return Right(res);
    } on ServerFailure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, BookPaginationEntity>> getNewBooks() async {
    try {
      final res = await _remoteDataSource.getNewBooks();

      return Right(res);
    } on ServerFailure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, BookPaginationEntity>> searchBooks(
      SearchDTO params) async {
    try {
      final res = await _remoteDataSource.searchBooks(params);
      _localDataSource.addSearchTerm(params.query);

      return Right(res);
    } on ServerFailure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<String>>> getSearchHistory() async {
    try {
      final res = await _localDataSource.getSearchHistory();

      return Right(res);
    } on ServerFailure catch (error) {
      return Left(error);
    }
  }
}
