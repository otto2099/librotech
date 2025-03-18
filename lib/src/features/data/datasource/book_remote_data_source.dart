import 'package:dio/dio.dart';
import 'package:librotech/src/core/error/failures.dart';
import 'package:librotech/src/core/http/api.dart';
import 'package:librotech/src/features/data/DTOs/search_dto.dart';
import 'package:librotech/src/features/data/models/book_detail_model.dart';
import 'package:librotech/src/features/data/models/book_pagination_model.dart';
import 'package:librotech/src/features/domain/entities/book_detail_entity.dart';
import 'package:librotech/src/features/domain/entities/book_pagination_entity.dart';

abstract class BookRemoteDataSource {
  Future<BookPaginationEntity> searchBooks(SearchDTO params);
  Future<BookPaginationEntity> getNewBooks();
  Future<BookDetailsEntity> getBookDetails(String id);
}

class BookRemoteDataSourceImpl extends ApiProvider
    implements BookRemoteDataSource {
  @override
  Future<BookDetailsEntity> getBookDetails(String id) async {
    try {
      final res = await dio.get(
        "/books/$id",
      );
      return BookDetailsModel.fromJson(res.data);
    } on DioException catch (error) {
      throw ServerFailure(error: error);
    }
  }

  @override
  Future<BookPaginationEntity> getNewBooks() async {
    try {
      final res = await dio.get(
        "/new",
      );
      return BookPaginationModel.fromJson(res.data);
    } on DioException catch (error) {
      throw ServerFailure(error: error);
    }
  }

  @override
  Future<BookPaginationEntity> searchBooks(SearchDTO params) async {
    try {
      final res = await dio.get(
        "/search/${params.query}",
      );

      return BookPaginationModel.fromJson(res.data);
    } on DioException catch (error) {
      throw ServerFailure(error: error);
    }
  }
}
