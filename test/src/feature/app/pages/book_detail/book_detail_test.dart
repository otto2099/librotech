import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:librotech/src/features/domain/usecases/get_book_details_use_cases.dart';
import 'package:mocktail/mocktail.dart';
import 'package:librotech/src/features/app/pages/book_detail/book_detail_controller.dart';
import 'package:librotech/src/features/app/pages/book_detail/book_detail_screen.dart';
import 'package:librotech/src/features/domain/entities/book_detail_entity.dart';

// Mock for BookDetailController
class MockBookDetailController extends GetxController
    with Mock
    implements BookDetailController {}

class MockGetBookDetailsUseCase extends Mock implements GetBookDetailsUseCase {}

void main() {
  late MockBookDetailController mockController;

  setUp(() {
    mockController = MockBookDetailController();
    Get.put<BookDetailController>(mockController);
    Get.parameters = {'id': '1234567890123'};
    const testBook = BookDetailsEntity(
      error: '',
      title: "Test Book",
      subtitle: "Test Subtitle",
      authors: "Test Author",
      publisher: "Test Publisher",
      isbn10: "1234567890",
      isbn13: "1234567890123",
      pages: "300",
      year: "2022",
      rating: "4.5",
      desc: "Test Description",
      price: "\$29.99",
      image: "https://itbook.store/img/books/9781617294136.png",
      url: "https://itbook.store/books/9781617294136",
      pdf: null,
    );

    when(() => mockController.bookDetailsEntity).thenReturn(testBook);
  });

  testWidgets('should display loading indicator when bookDetailsEntity is null',
      (WidgetTester tester) async {
    // Arrange: Mock empty state
    when(() => mockController.bookDetailsEntity).thenReturn(null);
    when(() => mockController.getBookDetailsUseCase(any()))
        .thenAnswer((_) async => Future.value());

    // Act: Initialize widget
    await tester.pumpWidget(
      const GetMaterialApp(
        home: BookDetailScreen(),
      ),
    );

    await tester.pump();

    // Assert: Expect CircularProgressIndicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
