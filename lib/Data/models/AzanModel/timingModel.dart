import 'dart:convert';

import 'package:azkar_application_/Domain/Entity/AzanEntity/timings.dart';

// ignore: must_be_immutable
class TimgingModel extends Timings {
  TimgingModel(
      {required super.fajr,
      required super.sunrise,
      required super.dhuhr,
      required super.asr,
      required super.sunset,
      required super.maghrib,
      required super.isha,
      required super.imsak,
      required super.midnight,
      required super.firstthird,
      required super.lastthird});

  Timings copyWith({
    String? fajr,
    String? sunrise,
    String? dhuhr,
    String? asr,
    String? sunset,
    String? maghrib,
    String? isha,
    String? imsak,
    String? midnight,
    String? firstthird,
    String? lastthird,
  }) {
    return Timings(
      fajr: fajr ?? this.fajr,
      sunrise: sunrise ?? this.sunrise,
      dhuhr: dhuhr ?? this.dhuhr,
      asr: asr ?? this.asr,
      sunset: sunset ?? this.sunset,
      maghrib: maghrib ?? this.maghrib,
      isha: isha ?? this.isha,
      imsak: imsak ?? this.imsak,
      midnight: midnight ?? this.midnight,
      firstthird: firstthird ?? this.firstthird,
      lastthird: lastthird ?? this.lastthird,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fajr': fajr,
      'sunrise': sunrise,
      'dhuhr': dhuhr,
      'asr': asr,
      'sunset': sunset,
      'maghrib': maghrib,
      'isha': isha,
      'imsak': imsak,
      'midnight': midnight,
      'firstthird': firstthird,
      'lastthird': lastthird,
    };
  }

  factory TimgingModel.fromMap(Map<String, dynamic> map) {
    return TimgingModel(
      fajr: map['Fajr'] != null ? map['Fajr'] as String : null,
      sunrise: map['Sunrise'] != null ? map['Sunrise'] as String : null,
      dhuhr: map['Dhuhr'] != null ? map['Dhuhr'] as String : null,
      asr: map['Asr'] != null ? map['Asr'] as String : null,
      sunset: map['Sunset'] != null ? map['Sunset'] as String : null,
      maghrib: map['Maghrib'] != null ? map['Maghrib'] as String : null,
      isha: map['Isha'] != null ? map['Isha'] as String : null,
      imsak: map['Imsak'] != null ? map['Imsak'] as String : null,
      midnight: map['Midnight'] != null ? map['Midnight'] as String : null,
      firstthird:
          map['Firstthird'] != null ? map['Firstthird'] as String : null,
      lastthird: map['Lastthird'] != null ? map['Lastthird'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TimgingModel.fromJson(String source) =>
      TimgingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Timings(fajr: $fajr, sunrise: $sunrise, dhuhr: $dhuhr, asr: $asr, sunset: $sunset, maghrib: $maghrib, isha: $isha, imsak: $imsak, midnight: $midnight, firstthird: $firstthird, lastthird: $lastthird)';
  }

  @override
  bool operator ==(covariant TimgingModel other) {
    if (identical(this, other)) return true;

    return other.fajr == fajr &&
        other.sunrise == sunrise &&
        other.dhuhr == dhuhr &&
        other.asr == asr &&
        other.sunset == sunset &&
        other.maghrib == maghrib &&
        other.isha == isha &&
        other.imsak == imsak &&
        other.midnight == midnight &&
        other.firstthird == firstthird &&
        other.lastthird == lastthird;
  }

  @override
  int get hashCode {
    return fajr.hashCode ^
        sunrise.hashCode ^
        dhuhr.hashCode ^
        asr.hashCode ^
        sunset.hashCode ^
        maghrib.hashCode ^
        isha.hashCode ^
        imsak.hashCode ^
        midnight.hashCode ^
        firstthird.hashCode ^
        lastthird.hashCode;
  }
}
