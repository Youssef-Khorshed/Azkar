import 'package:equatable/equatable.dart';

class TasbehModel extends Equatable {
  String title;
  int count;

  TasbehModel({required this.title, required this.count});

  @override
  List<Object?> get props => [title, count];
}
