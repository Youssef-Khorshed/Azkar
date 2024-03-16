import 'package:azkar_application_/Core/Internet/internetconnection.dart';
import 'package:azkar_application_/Data/Datasource/remote.dart';
import 'package:azkar_application_/Data/ReopImp/repoimp.dart';
import 'package:azkar_application_/Domain/Repo/repo.dart';
import 'package:azkar_application_/Domain/Usecase/getAzanUseCase.dart';
import 'package:azkar_application_/Presentation/Logic/bloc/azkar_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final db = GetIt.instance;

Future<void> init() async {
  //Bloc
  db.registerFactory(() => AzkarBloc(getAzanUsecase: db()));
  //usecase
  db.registerLazySingleton(() => GetAzanUsecase(repo: db()));
  //Remote
  db.registerLazySingleton<RemoteAzan>(() => RemoteAzanImp(dio: db()));

  //Repo
  db.registerLazySingleton<AzanRepo>(
      () => AzanRepoImp(remoteAzan: db(), networkInfo: db()));

  //Network
  db.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(db()));

  //objects
  final dio = Dio(BaseOptions());
  db.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  db.registerLazySingleton(() => dio);
}
