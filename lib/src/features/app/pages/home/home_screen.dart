import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librotech/src/features/app/pages/home/home_controller.dart';
import 'package:librotech/src/features/app/widgets/book_tile.dart';
import 'package:librotech/src/features/app/widgets/custom_text_field_with_title.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.indigo,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Libro Tech'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const Text(
                  '¿Qué libro estás buscando hoy?',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20),
                CustomTextFieldWithTitle(
                  sufixIcon: IconButton(
                    icon: const Icon(
                      Icons.history_sharp,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await controller.getSearchHistory();
                      controller.showSearchHistoryDialog(
                        context,
                        (String value) {},
                      );
                    },
                  ),
                  width: MediaQuery.of(context).size.width,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      controller.debouncer.run(() {
                        controller.searchBooksUseCase();
                      });
                    } else {
                      controller.getNewBooksUseCase();
                    }
                  },
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Obligatorio' : null,
                  controller: controller.searchController.value,
                  hint: 'mongodb',
                  borderColor: Colors.white,
                  obscureText: false,
                  title: 'Search',
                  fontSizeTitle: 14,
                  colorTitle: Colors.white,
                  fontWeightTitle: FontWeight.w400,
                  textAlignTitle: TextAlign.left,
                  keyBoardType: TextInputType.name,
                ),
                const SizedBox(height: 10),
                GetBuilder<HomeController>(
                  id: "Books",
                  initState: (state) => controller.getNewBooksUseCase(),
                  builder: (HomeController ctrl) {
                    if (ctrl.bookList?.books == null ||
                        ctrl.bookList!.books!.isEmpty) {
                      return const CardLoading(
                        height: 100,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        margin: EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: Icon(Icons.search),
                          title: Text(""),
                        ),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: ctrl.bookList!.books!.length,
                        itemBuilder: (context, index) {
                          return BookTile(
                            book: ctrl.bookList!.books![index],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
