import 'dart:convert';
import 'package:azkar_application_/Data/models/AzanModel/HijriModel.dart';
import 'package:azkar_application_/Domain/Entity/AzanEntity/Hijri.dart';
import 'package:equatable/equatable.dart';

class Date extends Equatable {
  String? readable;
  String? timestamp;
  HijriModel? hijri;

  Date({
    required this.readable,
    required this.timestamp,
    required this.hijri,
  });

  @override
  List<Object?> get props => [
        readable,
        timestamp,
        hijri,
      ];
}
