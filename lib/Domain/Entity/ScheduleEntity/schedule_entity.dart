import 'package:equatable/equatable.dart';

class PrayerTime extends Equatable {
  String title;
  String content;
  DateTime time;
  String icon;

  PrayerTime(
      {required this.title,
      required this.content,
      required this.time,
      required this.icon});

  @override
  List<Object?> get props => [title, content, time, icon];
}
