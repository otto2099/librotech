import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librotech/src/features/app/pages/book_detail/book_detail_controller.dart';
import 'package:librotech/src/features/app/widgets/custom_title.dart';

class BookDetailScreen extends StatelessWidget {
  static String routeName = '/detail';
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BookDetailController controller = Get.find<BookDetailController>();
    final String? bookId = Get.parameters['id'];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 47, 61, 5),
      resizeToAvoidBottomInset: false,
      body: GetBuilder<BookDetailController>(
        id: 'BookDetail',
        initState: (state) => controller.getBookDetailsUseCase(bookId!),
        builder: (BookDetailController ctrl) {
          if (ctrl.bookDetailsEntity == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.indigo,
                expandedHeight: 300,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.all(0),
                  centerTitle: true,
                  background: Image.network(
                    ctrl.bookDetailsEntity!.image!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/no-image.jpg',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    CustomTitle(
                      bookDetailsEntity: ctrl.bookDetailsEntity!,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Text(
                        ctrl.bookDetailsEntity!.desc!,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Autor: ${ctrl.bookDetailsEntity!.authors!}',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Text(
                        'Paginas: ${ctrl.bookDetailsEntity!.pages!}',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        'Año : ${ctrl.bookDetailsEntity!.year!}',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 150),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: MaterialButton(
                          color: Colors.green,
                          onPressed: () {},
                          child: Text(
                            ctrl.bookDetailsEntity!.price!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
