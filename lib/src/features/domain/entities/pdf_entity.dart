import 'package:equatable/equatable.dart';

class PdfEntity extends Equatable {
  final String? chapter2;
  final String? chapter5;

  const PdfEntity({
    this.chapter2,
    this.chapter5,
  });

  PdfEntity copyWith({
    String? chapter2,
    String? chapter5,
  }) =>
      PdfEntity(
        chapter2: chapter2 ?? this.chapter2,
        chapter5: chapter5 ?? this.chapter5,
      );

  @override
  List<Object?> get props => [
        chapter2,
        chapter5,
      ];
}
