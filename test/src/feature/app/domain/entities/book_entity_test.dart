import 'package:flutter_test/flutter_test.dart';
import 'package:librotech/src/features/domain/entities/book_entity.dart';

void main() {
  group('BookEntity', () {
    const book = BookEntity(
      title: 'Título de prueba',
      subtitle: 'Subtítulo de prueba',
      isbn13: '1234567890123',
      price: '\$20.00',
      image: 'https://example.com/imagen.jpg',
      url: 'https://example.com',
    );

    test('debe ser igual a otra instancia con los mismos valores', () {
      const otraEntidad = BookEntity(
        title: 'Título de prueba',
        subtitle: 'Subtítulo de prueba',
        isbn13: '1234567890123',
        price: '\$20.00',
        image: 'https://example.com/imagen.jpg',
        url: 'https://example.com',
      );
      expect(book, equals(otraEntidad));
    });

    test('copyWith debe actualizar solo los valores modificados', () {
      final copia = book.copyWith(title: 'Nuevo Título');
      expect(copia.title, equals('Nuevo Título'));
      expect(copia.subtitle, equals(book.subtitle));
      expect(copia.isbn13, equals(book.isbn13));
      expect(copia.price, equals(book.price));
      expect(copia.image, equals(book.image));
      expect(copia.url, equals(book.url));
    });

    test('copyWith sin argumentos debe retornar una copia igual', () {
      final copia = book.copyWith();
      expect(copia, equals(book));
    });
  });
}
