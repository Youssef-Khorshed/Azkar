import 'dart:convert';

import 'package:equatable/equatable.dart';

class Hijri extends Equatable {
  String? date;
  String? format;
  String? day;
  String? year;

  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.year,
  });

  @override
  List<Object?> get props => [
        date,
        format,
        day,
        year,
      ];
}
