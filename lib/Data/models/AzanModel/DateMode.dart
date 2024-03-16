import 'dart:convert';

import 'package:azkar_application_/Data/models/AzanModel/HijriModel.dart';
import 'package:azkar_application_/Domain/Entity/AzanEntity/Date.dart';

// ignore: must_be_immutable
class DateModel extends Date {
  DateModel(
      {required super.hijri,
      required super.readable,
      required super.timestamp});
  DateModel copyWith({
    String? readable,
    String? timestamp,
    HijriModel? hijri,
  }) {
    return DateModel(
      readable: readable ?? this.readable,
      timestamp: timestamp ?? this.timestamp,
      hijri: hijri ?? this.hijri,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'readable': readable,
      'timestamp': timestamp,
      'hijri': hijri?.toMap(),
    };
  }

  factory DateModel.fromMap(Map<String, dynamic> map) {
    return DateModel(
      readable: map['readable'] != null ? map['readable'] as String : null,
      timestamp: map['timestamp'] != null ? map['timestamp'] as String : null,
      hijri: map['hijri'] != null
          ? HijriModel.fromMap(map['hijri'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DateModel.fromJson(String source) =>
      DateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Date(readable: $readable, timestamp: $timestamp, hijri: $hijri)';

  @override
  bool operator ==(covariant DateModel other) {
    if (identical(this, other)) return true;

    return other.readable == readable &&
        other.timestamp == timestamp &&
        other.hijri == hijri;
  }

  @override
  int get hashCode => readable.hashCode ^ timestamp.hashCode ^ hijri.hashCode;
}
