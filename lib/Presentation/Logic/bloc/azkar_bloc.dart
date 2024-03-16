import 'dart:async';

import 'package:azkar_application_/Core/Exceptions/failure.dart';
import 'package:azkar_application_/Core/UserLocation%20Services/get_user_location.dart';
import 'package:azkar_application_/Domain/Entity/AzanEntity/azanData.dart';
import 'package:azkar_application_/Domain/Usecase/getAzanUseCase.dart';
import 'package:azkar_application_/Presentation/UI/Azan/azan_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

part 'azkar_event.dart';
part 'azkar_state.dart';

class AzkarBloc extends Bloc<AzkarEvent, AzkarState> {
  GetAzanUsecase getAzanUsecase;
  static AzanEntity? entity;
  List<Model> timesOfAzan = [];

  AzkarBloc({required this.getAzanUsecase}) : super(AzkarInitial()) {
    on<AzkarEvent>;
    on<GetAzanEvent>(getazan);
  }

  FutureOr<void> getazan(GetAzanEvent event, Emitter<AzkarState> emit) async {
    emit(GetAzanLoading());
    String date = getFormattedDateTime();
    Position location = await getUserLocation();
    Either<Failure, AzanEntity> result = await getAzanUsecase.call(
        lat: location.latitude.toString(),
        long: location.longitude.toString(),
        date: date);
    result.fold(
        (failure) => {
              emit(GetAzanFail(
                  message: HandleFailure.getfailure(failure: failure))),
              Fluttertoast.showToast(
                  msg: HandleFailure.getfailure(failure: failure))
            },
        (r) => {
              entity = r,
              // print('=======+++++++++++++++++++'),
              // print('${entity}'),
              timesOfAzan = [
                Model(
                    name: 'الفجر',
                    time: entity!.timings!.fajr!,
                    image: 'assets/images/Fajr.png'),
                Model(
                    name: 'الشروق',
                    time: entity!.timings!.sunrise!,
                    image: 'assets/images/SunRise.png'),
                Model(
                    name: 'الظهر',
                    time: entity!.timings!.dhuhr!,
                    image: 'assets/images/Dhuhr.png'),
                Model(
                    name: 'العصر',
                    time: entity!.timings!.asr!,
                    image: 'assets/images/Asr.png'),
                Model(
                    name: 'المغرب',
                    time: entity!.timings!.maghrib!,
                    image: 'assets/images/Maghrib.png'),
                Model(
                    name: 'العشاء',
                    time: entity!.timings!.isha!,
                    image: 'assets/images/Isha.png'),
              ],
              print('=======++++++++========='),
              emit(const GetAzanSuccess())
            });
  }

  String getFormattedDateTime() {
    DateTime now = DateTime.now();
    String formattedDateTime = DateFormat('yyyy-MM-dd').format(now);
    return formattedDateTime;
  }

  Future<Position> getUserLocation() async {
    return await GetUserLocation.determinePosition();
  }

  // Future<void> initializeSharedPreferences() async {
  //   postion = await GetUserLocation.determinePosition();

  //   prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     isAzanSwitched = prefs.getBool('Azan switcher') ?? false;
  //     print(postion);
  //   });
  // }

  // Future<void> saveAzanSwitcherToSharedPreferences() async {
  //   await prefs.setBool('Azan switcher', isAzanSwitched);
  // }
}
