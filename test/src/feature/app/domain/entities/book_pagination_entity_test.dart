import 'package:flutter_test/flutter_test.dart';
import 'package:librotech/src/features/domain/entities/book_pagination_entity.dart';
import 'package:librotech/src/features/domain/entities/book_entity.dart';

void main() {
  group('BookPaginationEntity', () {
    const book1 = BookEntity(
      title: 'Título de prueba 1',
      subtitle: 'Subtítulo de prueba 1',
      isbn13: '1111111111111',
      price: '\$10.00',
      image: 'https://example.com/book1.jpg',
      url: 'https://example.com/book1',
    );

    const book2 = BookEntity(
      title: 'Título de prueba 2',
      subtitle: 'Subtítulo de prueba 2',
      isbn13: '2222222222222',
      price: '\$20.00',
      image: 'https://example.com/book2.jpg',
      url: 'https://example.com/book2',
    );

    const entity = BookPaginationEntity(
      error: 'No error',
      total: '2',
      page: '1',
      books: [book1, book2],
    );

    test('debe ser igual a otra instancia con los mismos valores', () {
      const otraEntidad = BookPaginationEntity(
        error: 'No error',
        total: '2',
        page: '1',
        books: [book1, book2],
      );
      expect(entity, equals(otraEntidad));
    });

    test('copyWith debe actualizar solo el valor modificado', () {
      final updatedEntity = entity.copyWith(page: '2');
      expect(updatedEntity.page, equals('2'));
      expect(updatedEntity.error, equals(entity.error));
      expect(updatedEntity.total, equals(entity.total));
      expect(updatedEntity.books, equals(entity.books));
    });

    test('copyWith sin argumentos debe retornar una copia igual', () {
      final copiedEntity = entity.copyWith();
      expect(copiedEntity, equals(entity));
    });
  });
}
