import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class InternetFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ApiFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnExpectedFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CashFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class HandleFailure {
  static String getfailure({required Failure failure}) {
    switch (failure.runtimeType) {
      case CashFailure:
        {
          return 'Cashe Failure';
        }
      case InternetFailure:
        {
          return 'Internet Failure';
        }
      case ApiFailure:
        {
          return 'API Failure';
        }

      default:
        {
          return 'Unexpected Failure';
        }
    }
  }
}
