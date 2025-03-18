import 'package:flutter_test/flutter_test.dart';
import 'package:librotech/src/features/domain/entities/pdf_entity.dart';

void main() {
  group('PdfEntity', () {
    const pdf = PdfEntity(
      chapter2: 'Contenido del capítulo 2',
      chapter5: 'Contenido del capítulo 5',
    );

    test('debe ser igual a otra instancia con los mismos valores', () {
      const otraPdf = PdfEntity(
        chapter2: 'Contenido del capítulo 2',
        chapter5: 'Contenido del capítulo 5',
      );
      expect(pdf, equals(otraPdf));
    });

    test('copyWith debe actualizar solo el valor modificado', () {
      final pdfActualizado =
          pdf.copyWith(chapter2: 'Nuevo contenido capítulo 2');
      expect(pdfActualizado.chapter2, equals('Nuevo contenido capítulo 2'));
      expect(pdfActualizado.chapter5, equals(pdf.chapter5));
    });

    test('copyWith sin argumentos debe retornar una copia igual', () {
      final pdfCopia = pdf.copyWith();
      expect(pdfCopia, equals(pdf));
    });
  });
}
