import 'package:dartz/dartz.dart';
import 'package:librotech/src/core/error/failures.dart';
import 'package:librotech/src/features/data/DTOs/search_dto.dart';
import 'package:librotech/src/features/data/datasource/book_remote_data_source.dart';
import 'package:librotech/src/features/domain/entities/book_detail_entity.dart';
import 'package:librotech/src/features/domain/entities/book_pagination_entity.dart';
import 'package:librotech/src/features/domain/repositories/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource _remoteDataSource;

  BookRepositoryImpl({
    required BookRemoteDataSource? remoteDataSource,
  })  : assert(remoteDataSource != null),
        _remoteDataSource = remoteDataSource!;

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

      return Right(res);
    } on ServerFailure catch (error) {
      return Left(error);
    }
  }
}
