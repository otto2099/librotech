import 'package:equatable/equatable.dart';
import 'package:librotech/src/features/domain/entities/book_entity.dart';

class BookPaginationEntity extends Equatable {
  final String? error;
  final String? total;
  final String? page;
  final List<BookEntity>? books;

  const BookPaginationEntity({
    this.error,
    this.total,
    this.page,
    this.books,
  });

  BookPaginationEntity copyWith({
    String? error,
    String? total,
    String? page,
    List<BookEntity>? books,
  }) =>
      BookPaginationEntity(
        error: error ?? this.error,
        total: total ?? this.total,
        page: page ?? this.page,
        books: books ?? this.books,
      );

  @override
  List<Object?> get props => [
        error,
        total,
        page,
        books,
      ];
}
