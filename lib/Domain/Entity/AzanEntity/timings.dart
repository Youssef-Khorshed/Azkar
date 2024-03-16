import 'dart:convert';

import 'package:equatable/equatable.dart';

class Timings extends Equatable {
  dynamic fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstthird;
  String? lastthird;

  Timings(
      {required this.fajr,
      required this.sunrise,
      required this.dhuhr,
      required this.asr,
      required this.sunset,
      required this.maghrib,
      required this.isha,
      required this.imsak,
      required this.midnight,
      required this.firstthird,
      required this.lastthird});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
