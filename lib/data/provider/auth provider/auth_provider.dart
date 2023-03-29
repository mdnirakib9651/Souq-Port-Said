// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:souq_port_said/data/datasource/romote/exception/api_error_handler.dart';
import 'package:souq_port_said/data/model/response/base/api%20response/api_response.dart';
import 'package:souq_port_said/data/model/response/registration_model/registration_model.dart';
import 'package:souq_port_said/data/model/response/signIn_model/signin_model.dart';
import '../../../view/screen/dashboard/deshboard_screen.dart';
import '../../../view/screen/sign_up/sign_up.dart';
import '../../model/request/auth_repository/auth_repository.dart';

class AuthProvider with ChangeNotifier{
  AuthRepo authRepo;
  AuthProvider({required this.authRepo});

  Future getRegister(BuildContext context, RegistrationModel registrationModel, setState) async{
    ApiResponse apiResponse = await authRepo.registration(registrationModel);
    if(apiResponse.response != null && apiResponse.response!.statusCode == 201){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DeshBoardScreen(),));
      EasyLoading.showSuccess("Account has been created successfully!");
      setState(() {
        firstNameController.clear();
        emailController.clear();
        phoneController.clear();
        passController.clear();
        conPassController.clear();
      });
    } else{
      EasyLoading.showError(ApiErrorHandler.getMessage(apiResponse));
    }
    notifyListeners();
  }

  Future getSignIn(BuildContext context, String email, String pass) async{
    ApiResponse apiResponse = await authRepo.signIn(email, pass);
    if(apiResponse.response != null && apiResponse.response!.statusCode == 200){
      Map map = apiResponse.response!.data;
      String token = map['auth_token'];
      authRepo.saveAuthToken(token);
      authRepo.setIsSignIn(true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DeshBoardScreen(),));
      debugPrint("token : $token");
      log("token : $token");
      EasyLoading.showSuccess("LogIn Success");
    } else{
      EasyLoading.showError(ApiErrorHandler.getMessage(apiResponse));
    }
    notifyListeners();
  }

  User? _user;
  User? get user => _user;
  Future getUserInfo() async{
    ApiResponse apiResponse = await authRepo.userInfo();
    if(apiResponse.response != null && apiResponse.response!.statusCode == 200){
      _user = User.fromJson(apiResponse.response!.data);
      debugPrint("User Info : $_user");
      print("User Info : $_user");
    } else{
      EasyLoading.showError(ApiErrorHandler.getMessage(apiResponse));
    }
    notifyListeners();
  }

  getIsSignIn(){
    return authRepo.getIsSignIn();
  }

  getToken(){
    return authRepo.getAuthToken();
  }
}