import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AzkarModel extends Equatable {
  bool isSwitched;
  TimeOfDay timeOfDay;
  //var timeSelected;
  AzkarModel({required this.isSwitched, required this.timeOfDay});

  @override
  List<Object?> get props => [isSwitched, timeOfDay];
}
