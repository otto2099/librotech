import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:librotech/src/features/domain/entities/book_detail_entity.dart';

class CustomTitle extends StatelessWidget {
  final BookDetailsEntity bookDetailsEntity;

  const CustomTitle({super.key, required this.bookDetailsEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            bookDetailsEntity.title!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: MaterialButton(
                  color: Colors.grey,
                  onPressed: () async {},
                  child: const Text(
                    'Wacth Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              RatingBar.builder(
                unratedColor: const Color.fromARGB(255, 144, 141, 110),
                itemSize: 20,
                initialRating: double.parse(bookDetailsEntity.rating!) / 2,
                allowHalfRating: true,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (_, __) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
