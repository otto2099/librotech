import 'package:flutter_test/flutter_test.dart';
import 'package:librotech/src/features/domain/entities/book_detail_entity.dart';
import 'package:librotech/src/features/domain/entities/pdf_entity.dart';

void main() {
  group('BookDetailsEntity', () {
    const pdf = PdfEntity(
        chapter2: 'https://example.com/sample.pdf',
        chapter5: 'https://example.com/sample.pdf');

    const entity = BookDetailsEntity(
      error: 'No Error',
      title: 'Título de prueba',
      subtitle: 'Subtítulo de prueba',
      authors: 'Autor de prueba',
      publisher: 'Editorial de prueba',
      isbn10: '1234567890',
      isbn13: '1234567890123',
      pages: '250',
      year: '2022',
      rating: '4.5',
      desc: 'Descripción de prueba',
      price: '\$10.00',
      image: 'https://example.com/imagen.jpg',
      url: 'https://example.com',
      pdf: pdf,
    );

    test('debe ser igual a otra instancia con los mismos valores', () {
      const otraEntidad = BookDetailsEntity(
        error: 'No Error',
        title: 'Título de prueba',
        subtitle: 'Subtítulo de prueba',
        authors: 'Autor de prueba',
        publisher: 'Editorial de prueba',
        isbn10: '1234567890',
        isbn13: '1234567890123',
        pages: '250',
        year: '2022',
        rating: '4.5',
        desc: 'Descripción de prueba',
        price: '\$10.00',
        image: 'https://example.com/imagen.jpg',
        url: 'https://example.com',
        pdf: pdf,
      );
      expect(entity, equals(otraEntidad));
    });

    test('copyWith debe actualizar solo los valores modificados', () {
      final copia = entity.copyWith(title: 'Nuevo Título');
      expect(copia.title, equals('Nuevo Título'));
      expect(copia.subtitle, equals(entity.subtitle));
      expect(copia.authors, equals(entity.authors));
    });

    test('copyWith sin argumentos debe retornar una copia igual', () {
      final copia = entity.copyWith();
      expect(copia, equals(entity));
    });
  });
}
