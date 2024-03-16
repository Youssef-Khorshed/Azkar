import 'package:azkar_application_/Core/Exceptions/failure.dart';
import 'package:azkar_application_/Domain/Entity/AzanEntity/azanData.dart';
import 'package:dartz/dartz.dart';

abstract class AzanRepo {
  Future<Either<Failure, AzanEntity>> getAzanTimes({
    required String lat,
    required String long,
    required String date,
  });
}
