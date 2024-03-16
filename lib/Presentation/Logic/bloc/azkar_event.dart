part of 'azkar_bloc.dart';

sealed class AzkarEvent extends Equatable {
  const AzkarEvent();

  @override
  List<Object> get props => [];
}

class GetAzanEvent extends AzkarEvent {}
