// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:azkar_application_/Data/models/AzanModel/DateMode.dart';
import 'package:azkar_application_/Data/models/AzanModel/timingModel.dart';
import 'package:azkar_application_/Domain/Entity/AzanEntity/Date.dart';
import 'package:azkar_application_/Domain/Entity/AzanEntity/timings.dart';
import 'package:equatable/equatable.dart';

class AzanEntity extends Equatable {
  TimgingModel? timings;
  DateModel? date;
  AzanEntity({
    required this.timings,
    required this.date,
  });
  @override
  List<Object?> get props => [
        timings,
        date,
      ];
}
