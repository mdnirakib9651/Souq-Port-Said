import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_port_said/data/datasource/romote/dio/dio_client.dart';
import 'package:souq_port_said/data/model/response/base/api%20response/api_response.dart';
import 'package:souq_port_said/utill/app_constants.dart';
import '../../../datasource/romote/exception/api_error_handler.dart';
import '../../response/registration_model/registration_model.dart';

class AuthRepo{
  DioClient dioClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> registration(RegistrationModel registrationModel) async{
    try{
      Response response = await dioClient.post(
        AppConstants.registerUrl,
        data: registrationModel.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> signIn(String email, String pass) async{
    try{
      Response response = await dioClient.post(
        AppConstants.logInUrl,
        data: {"email": email,"password": pass},
      );
      return ApiResponse.withSuccess(response);
    } catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<void> saveAuthToken(String token) async{
    dioClient.token = token;
    dioClient.dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    try{
      await sharedPreferences.setString(AppConstants.token, token);
    } catch(e){
      throw e;
    }
  }

  Future<void> setIsSignIn(bool isLogIn) async{
    await sharedPreferences.setBool(AppConstants.isLogIn, isLogIn);
  }

  bool getIsSignIn(){
    return sharedPreferences.getBool(AppConstants.isLogIn) ?? false;
  }

  String getAuthToken(){
    return sharedPreferences.getString(AppConstants.token) ?? "";
  }

  Future<ApiResponse> userInfo() async{
    try{
      Response response = await dioClient.get(
        AppConstants.userUrl,
      );
      return ApiResponse.withSuccess(response);
    } catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}