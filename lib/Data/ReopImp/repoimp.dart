import 'package:azkar_application_/Core/Exceptions/failure.dart';
import 'package:azkar_application_/Core/Internet/internetconnection.dart';
import 'package:azkar_application_/Data/Datasource/remote.dart';
import 'package:azkar_application_/Domain/Entity/AzanEntity/azanData.dart';
import 'package:azkar_application_/Domain/Repo/repo.dart';

import 'package:dartz/dartz.dart';

class AzanRepoImp extends AzanRepo {
  NetworkInfo networkInfo;
  RemoteAzan remoteAzan;
  AzanRepoImp({
    required this.remoteAzan,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AzanEntity>> getAzanTimes(
      {required String lat, required String long, required String date}) async {
    try {
      if (await networkInfo.isConnected) {
        final res =
            await remoteAzan.getAzanTimes(lat: lat, long: long, date: date);
        return res.fold((l) {
          return Left(ApiFailure());
        }, (r) {
          return Right(r);
        });
      } else {
        return Left(InternetFailure());
      }
    } catch (error) {
      return Left(UnExpectedFailure());
    }
  }
}
