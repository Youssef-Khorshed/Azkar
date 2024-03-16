import 'package:azkar_application_/Core/Exceptions/failure.dart';
import 'package:azkar_application_/Domain/Entity/AzanEntity/azanData.dart';
import 'package:azkar_application_/Domain/Repo/repo.dart';
import 'package:dartz/dartz.dart';

class GetAzanUsecase {
  AzanRepo repo;
  GetAzanUsecase({required this.repo});
  Future<Either<Failure, AzanEntity>> call({
    required String lat,
    required String long,
    required String date,
  }) async {
    return await repo.getAzanTimes(lat: lat, long: long, date: date);
  }
}
