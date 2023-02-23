import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utill/app_constants.dart';
import '../../../datasource/romote/dio/dio_client.dart';

class SplashRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  SplashRepo({required this.dioClient, required this.sharedPreferences});

  void initSharedData() async {
    if (!sharedPreferences.containsKey(AppConstants.cartList)) {
      sharedPreferences.setStringList(AppConstants.cartList, []);
    }
  }
}