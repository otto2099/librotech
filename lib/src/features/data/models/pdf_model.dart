import 'package:librotech/src/features/domain/entities/pdf_entity.dart';

class PdfModel extends PdfEntity {
  const PdfModel({
    String? chapter2,
    String? chapter5,
  }) : super(
          chapter2: chapter2 ?? chapter2,
          chapter5: chapter5 ?? chapter5,
        );

  factory PdfModel.fromJson(Map<String, dynamic> json) => PdfModel(
        chapter2: json["Chapter 2"],
        chapter5: json["Chapter 5"],
      );
}
