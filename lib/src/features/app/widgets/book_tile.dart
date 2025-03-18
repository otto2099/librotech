import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librotech/src/features/app/pages/book_detail/book_detail_screen.dart';
import 'package:librotech/src/features/domain/entities/book_entity.dart';

class BookTile extends StatelessWidget {
  final BookEntity book;

  const BookTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.network(book.image!, width: 50, fit: BoxFit.cover),
            title: Text(book.title!),
            onTap: () {
              Get.toNamed(
                BookDetailScreen.routeName,
                parameters: {'id': book.isbn13!},
              );
            },
          ),
        ],
      ),
    );
  }
}
