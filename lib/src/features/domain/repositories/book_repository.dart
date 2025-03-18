import 'package:dartz/dartz.dart';
import 'package:librotech/src/core/error/failures.dart';
import 'package:librotech/src/features/data/DTOs/search_dto.dart';
import 'package:librotech/src/features/domain/entities/book_detail_entity.dart';
import 'package:librotech/src/features/domain/entities/book_pagination_entity.dart';

abstract class BookRepository {
  Future<Either<Failure, BookPaginationEntity>> searchBooks(SearchDTO params);
  Future<Either<Failure, BookPaginationEntity>> getNewBooks();
  Future<Either<Failure, List<String>>> getSearchHistory();
  Future<Either<Failure, BookDetailsEntity>> getBookDetails(String id);
}
