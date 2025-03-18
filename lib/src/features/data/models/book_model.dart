import 'package:librotech/src/features/domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  const BookModel({
    String? title,
    String? subtitle,
    String? isbn13,
    String? price,
    String? image,
    String? url,
  }) : super(
          title: title ?? title,
          subtitle: subtitle ?? subtitle,
          isbn13: isbn13 ?? isbn13,
          price: price ?? price,
          image: image ?? image,
          url: url ?? url,
        );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        title: json["title"],
        subtitle: json["subtitle"],
        isbn13: json["isbn13"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
      );
}
