import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_port_said/data/datasource/romote/dio/dio_client.dart';
import 'package:souq_port_said/data/model/request/newproduct_dio_repo.dart';
import 'package:souq_port_said/data/model/request/splash%20repository/splash_repo.dart';
import 'package:souq_port_said/data/provider/newproduct_dio_provider.dart';
import 'package:souq_port_said/data/provider/splash%20provider/splash_provider.dart';
import 'package:souq_port_said/helper/network_info.dart';
import 'package:souq_port_said/utill/app_constants.dart';

import 'data/datasource/romote/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async{
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  //---------->>> Repository <<<------------
  sl.registerLazySingleton(() => SplashRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => NewProductDioRepo(dioClient: sl()));

  //----------->>> Provider <<<-------------
  sl.registerLazySingleton(() => SplashProvider(splashRepo: sl()));
  sl.registerFactory(() => NewProductDioProvider(newProductDioRepo: sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}