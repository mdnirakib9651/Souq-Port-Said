import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_port_said/data/datasource/romote/dio/dio_client.dart';
import 'package:souq_port_said/data/model/response/love%20model/love_model.dart';
import 'package:souq_port_said/utill/app_constants.dart';

class LoveRepository{
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  LoveRepository({required this.dioClient, required this.sharedPreferences});

  List<LoveModel> getLoveList(){
    List<String>? loves = sharedPreferences.getStringList(AppConstants.loveList);
    List<LoveModel> loveList = [];
    loves!.forEach((love) => loveList.add(LoveModel.fromJson(jsonDecode(love))));
    return loveList;
  }

  void addToLoveList(List<LoveModel> loveList){
    List<String> loves = [];
    loveList.forEach((loveModel) => loves.add(jsonEncode(loveModel)));
    sharedPreferences.setStringList(AppConstants.loveList, loves);
  }
}