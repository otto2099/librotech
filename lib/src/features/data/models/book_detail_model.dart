import 'package:librotech/src/features/data/models/pdf_model.dart';
import 'package:librotech/src/features/domain/entities/book_detail_entity.dart';
import 'package:librotech/src/features/domain/entities/pdf_entity.dart';

class BookDetailsModel extends BookDetailsEntity {
  const BookDetailsModel({
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
  }) : super(
          error: error ?? error,
          title: title ?? title,
          subtitle: subtitle ?? subtitle,
          authors: authors ?? authors,
          publisher: publisher ?? publisher,
          isbn10: isbn10 ?? isbn10,
          isbn13: isbn13 ?? isbn13,
          pages: pages ?? pages,
          year: year ?? year,
          rating: rating ?? rating,
          desc: desc ?? desc,
          price: price ?? price,
          image: image ?? image,
          url: url ?? url,
          pdf: pdf ?? pdf,
        );

  factory BookDetailsModel.fromJson(Map<String, dynamic> json) =>
      BookDetailsModel(
        error: json["error"],
        title: json["title"],
        subtitle: json["subtitle"],
        authors: json["authors"],
        publisher: json["publisher"],
        isbn10: json["isbn10"],
        isbn13: json["isbn13"],
        pages: json["pages"],
        year: json["year"],
        rating: json["rating"],
        desc: json["desc"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
        pdf: json["pdf"] != null ? PdfModel.fromJson(json["pdf"]) : null,
      );
}
