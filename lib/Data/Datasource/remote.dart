import 'dart:convert';

import 'package:azkar_application_/Core/Exceptions/exception.dart';
import 'package:azkar_application_/Core/Strings/strings.dart';
import 'package:azkar_application_/Data/models/AzanModel/DateMode.dart';
import 'package:azkar_application_/Data/models/AzanModel/azanModel.dart';
import 'package:azkar_application_/Data/models/AzanModel/timingModel.dart';
import 'package:azkar_application_/Domain/Entity/AzanEntity/timings.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class RemoteAzan {
  Future<Either<Exception, AzanModel>> getAzanTimes({
    required String lat,
    required String long,
    required String date,
  });
}

class RemoteAzanImp extends RemoteAzan {
  Dio dio;
  RemoteAzanImp({required this.dio});

  @override
  Future<Either<Exception, AzanModel>> getAzanTimes({
    required String lat,
    required String long,
    required String date,
  }) async {
    try {
      final resopnse =
          await dio.get(Strings.baseApi(lat: lat, long: long, date: date));

      if (resopnse.statusCode == 200 || resopnse.data == null) {
        final res = resopnse.data['data'];
        // print(
        //     'uri is ->>   ${Strings.baseApi(lat: lat, long: long, date: date)}');
        final data = AzanModel.fromMap(res);
        // print('=======+++json+++++=========');
        // print('${date}');
        // print('=======+++from json+++++=========');
        return Right(data);
      } else {
        throw ApiException();
      }
    } catch (error) {
      throw Exception();
    }
  }
}
