part of 'azkar_bloc.dart';

sealed class AzkarState extends Equatable {
  const AzkarState();

  @override
  List<Object> get props => [];
}

final class AzkarInitial extends AzkarState {}

class GetAzanLoading extends AzkarState {
  const GetAzanLoading();

  @override
  List<Object> get props => [];
}

class GetAzanSuccess extends AzkarState {
  const GetAzanSuccess();

  @override
  List<Object> get props => [];
}

class GetAzanFail extends AzkarState {
  String message;
  GetAzanFail({required this.message});

  @override
  List<Object> get props => [];
}
