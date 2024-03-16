import 'dart:convert';

import 'package:azkar_application_/Data/models/AzanModel/DateMode.dart';
import 'package:azkar_application_/Data/models/AzanModel/timingModel.dart';
import 'package:azkar_application_/Domain/Entity/AzanEntity/azanData.dart';

class AzanModel extends AzanEntity {
  AzanModel({required super.timings, required super.date});
  AzanModel copyWith({
    TimgingModel? timings,
    DateModel? date,
  }) {
    return AzanModel(
      timings: timings ?? this.timings,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timings': timings?.toMap(),
      'date': date?.toMap(),
    };
  }

  // factory AzanModel.fromMap(Map<String, dynamic> map) {
  //   return AzanModel(
  //     timings: map['timings'] != null
  //         ? TimgingModel.fromMap(map['timings'] as Map<String, dynamic>)
  //         : null,
  //     date: map['date'] != null
  //         ? DateModel.fromMap(map['date'] as Map<String, dynamic>)
  //         : null,
  //   );
  // }

  factory AzanModel.fromMap(Map<String, dynamic> json) {
    final timings =
        json['timings'] != null ? TimgingModel.fromMap(json['timings']) : null;
    final date = json['date'] != null ? DateModel.fromMap(json['date']) : null;
    return AzanModel(timings: timings, date: date);
  }

  String toJson() => json.encode(toMap());

  factory AzanModel.fromJson(String source) =>
      AzanModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AzanData(timings: $timings, date: $date)';

  @override
  bool operator ==(covariant AzanModel other) {
    if (identical(this, other)) return true;

    return other.timings == timings && other.date == date;
  }

  @override
  int get hashCode => timings.hashCode ^ date.hashCode;
}
