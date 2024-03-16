import 'dart:convert';

import 'package:azkar_application_/Domain/Entity/AzanEntity/Hijri.dart';

class HijriModel extends Hijri {
  HijriModel(
      {required super.date,
      required super.format,
      required super.day,
      required super.year});

  Hijri copyWith({
    String? date,
    String? format,
    String? day,
    String? year,
  }) {
    return HijriModel(
      date: date ?? this.date,
      format: format ?? this.format,
      day: day ?? this.day,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'format': format,
      'day': day,
      'year': year,
    };
  }

  factory HijriModel.fromMap(Map<String, dynamic> map) {
    return HijriModel(
      date: map['date'] != null ? map['date'] as String : null,
      format: map['format'] != null ? map['format'] as String : null,
      day: map['day'] != null ? map['day'] as String : null,
      year: map['year'] != null ? map['year'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HijriModel.fromJson(String source) =>
      HijriModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Hijri(date: $date, format: $format, day: $day, year: $year)';
  }

  @override
  bool operator ==(covariant Hijri other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.format == format &&
        other.day == day &&
        other.year == year;
  }

  @override
  int get hashCode {
    return date.hashCode ^ format.hashCode ^ day.hashCode ^ year.hashCode;
  }
}
