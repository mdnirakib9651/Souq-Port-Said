import 'package:dio/dio.dart';
import 'package:souq_port_said/data/datasource/romote/dio/dio_client.dart';
import 'package:souq_port_said/utill/app_constants.dart';
import '../../response/catagory_model/catagory_model.dart';

class CatagoryRepo{
  final DioClient dioClient;
  CatagoryRepo({required this.dioClient});

  Future<List<CategoryModel>> getCatagory() async{
    try{
      Response response = await Dio().get(AppConstants.shopMaxBaseUrl + AppConstants.catagory);
      List<CategoryModel> catagoryList = [];
      for(var item in response.data){
        catagoryList.add(CategoryModel.fromJson(item));
      }
      return catagoryList;
    } catch(error, stacktrace){
      print("Exception : $error stacktrace: $stacktrace");
      return [];
    }
  }
}