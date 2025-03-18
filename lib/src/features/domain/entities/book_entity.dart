import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String? title;
  final String? subtitle;
  final String? isbn13;
  final String? price;
  final String? image;
  final String? url;

  const BookEntity({
    this.title,
    this.subtitle,
    this.isbn13,
    this.price,
    this.image,
    this.url,
  });

  BookEntity copyWith({
    String? title,
    String? subtitle,
    String? isbn13,
    String? price,
    String? image,
    String? url,
  }) =>
      BookEntity(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        isbn13: isbn13 ?? this.isbn13,
        price: price ?? this.price,
        image: image ?? this.image,
        url: url ?? this.url,
      );

  @override
  List<Object?> get props => [
        title,
        subtitle,
        isbn13,
        price,
        image,
        url,
      ];
}
