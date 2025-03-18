import 'package:equatable/equatable.dart';
import 'package:librotech/src/features/domain/entities/pdf_entity.dart';

class BookDetailsEntity extends Equatable {
  final String? error;
  final String? title;
  final String? subtitle;
  final String? authors;
  final String? publisher;
  final String? isbn10;
  final String? isbn13;
  final String? pages;
  final String? year;
  final String? rating;
  final String? desc;
  final String? price;
  final String? image;
  final String? url;
  final PdfEntity? pdf;

  const BookDetailsEntity({
    this.error,
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.isbn10,
    this.isbn13,
    this.pages,
    this.year,
    this.rating,
    this.desc,
    this.price,
    this.image,
    this.url,
    this.pdf,
  });

  BookDetailsEntity copyWith({
    String? error,
    String? title,
    String? subtitle,
    String? authors,
    String? publisher,
    String? isbn10,
    String? isbn13,
    String? pages,
    String? year,
    String? rating,
    String? desc,
    String? price,
    String? image,
    String? url,
    PdfEntity? pdf,
  }) =>
      BookDetailsEntity(
        error: error ?? this.error,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        authors: authors ?? this.authors,
        publisher: publisher ?? this.publisher,
        isbn10: isbn10 ?? this.isbn10,
        isbn13: isbn13 ?? this.isbn13,
        pages: pages ?? this.pages,
        year: year ?? this.year,
        rating: rating ?? this.rating,
        desc: desc ?? this.desc,
        price: price ?? this.price,
        image: image ?? this.image,
        url: url ?? this.url,
        pdf: pdf ?? this.pdf,
      );

  @override
  List<Object?> get props => [
        error,
        title,
        subtitle,
        authors,
        publisher,
        isbn10,
        isbn13,
        pages,
        year,
        rating,
        desc,
        price,
        image,
        url,
        pdf,
      ];
}
