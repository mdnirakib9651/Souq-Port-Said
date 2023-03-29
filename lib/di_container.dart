import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_port_said/data/datasource/romote/dio/dio_client.dart';
import 'package:souq_port_said/data/model/request/cart_repository/cart_popular_repo.dart';
import 'package:souq_port_said/data/model/request/cart_repository/cart_repo.dart';
import 'package:souq_port_said/data/model/request/catatory_repository/category_repo.dart';
import 'package:souq_port_said/data/model/request/find%20repository/band_repo.dart';
import 'package:souq_port_said/data/model/request/love%20repository/love_repository.dart';
import 'package:souq_port_said/data/model/request/homepage_repository/newproduct_dio_repo.dart';
import 'package:souq_port_said/data/model/request/splash%20repository/splash_repo.dart';
import 'package:souq_port_said/data/provider/auth%20provider/auth_provider.dart';
import 'package:souq_port_said/data/provider/cart%20provider/cart_provider.dart';
import 'package:souq_port_said/data/provider/catagory_provider/catagory_provider.dart';
import 'package:souq_port_said/data/provider/find%20provider/brand_provider.dart';
import 'package:souq_port_said/data/provider/love_provider/love_provider.dart';
import 'package:souq_port_said/data/provider/homepage_provider/newproduct_dio_provider.dart';
import 'package:souq_port_said/data/provider/splash%20provider/splash_provider.dart';
import 'package:souq_port_said/helper/network_info.dart';
import 'package:souq_port_said/utill/app_constants.dart';

import 'data/datasource/romote/dio/logging_interceptor.dart';
import 'data/model/request/auth_repository/auth_repository.dart';
import 'data/model/request/homepage_repository/popular_dio_repo.dart';
import 'data/provider/cart provider/cart_popular_provider.dart';
import 'data/provider/homepage_provider/popular_dio_provider.dart';

final sl = GetIt.instance;

Future<void> init() async{
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.shopMaxBaseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  //---------->>> Repository <<<------------
  sl.registerLazySingleton(() => SplashRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => NewProductDioRepo(dioClient: sl()));
  sl.registerLazySingleton(() => PopularDioRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CartRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => CartPopularRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => CatagoryRepo(dioClient: sl()));
  sl.registerLazySingleton(() => LoveRepository(dioClient: sl(), sharedPreferences: sl()));
  // --------------->>>>> Shop Max <<<<<<----------------
  sl.registerLazySingleton(() => BrandRepo(dioClient: sl()));
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));

  //----------->>> Provider <<<-------------
  sl.registerLazySingleton(() => SplashProvider(splashRepo: sl()));
  sl.registerFactory(() => NewProductDioProvider(newProductDioRepo: sl()));
  sl.registerFactory(() => PopularDioProvider(popularDioRepo: sl()));
  sl.registerFactory(() => CartProvider(cartRepo: sl()));
  sl.registerFactory(() => CartPopularProvider(cartPopularRepo: sl()));
  sl.registerFactory(() => CatagoryProvider(catagoryRepo: sl()));sl.registerFactory(() => LoveProvider(loveRepository: sl()));
  //--------------->>>>>>> Shop Max <<<<<<<----------------
  sl.registerFactory(() => BrandProvider(brandRepo: sl()));
  sl.registerFactory(() => AuthProvider(authRepo: sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}