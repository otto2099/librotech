import 'package:librotech/src/features/data/models/book_model.dart';
import 'package:librotech/src/features/domain/entities/book_entity.dart';
import 'package:librotech/src/features/domain/entities/book_pagination_entity.dart';

class BookPaginationModel extends BookPaginationEntity {
  const BookPaginationModel({
    String? error,
    String? total,
    String? page,
    List<BookEntity>? books,
  }) : super(
          error: error ?? error,
          total: total ?? total,
          page: page ?? page,
          books: books ?? books,
        );

  factory BookPaginationModel.fromJson(Map<String, dynamic> json) =>
      BookPaginationModel(
        error: json["error"],
        total: json["total"],
        page: json["page"],
        books: json["books"] == null
            ? []
            : List<BookEntity>.from(
                json["books"].map((x) => BookModel.fromJson(x)),
              ),
      );
}
