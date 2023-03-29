import 'package:dio/dio.dart';
import 'package:souq_port_said/data/datasource/romote/dio/dio_client.dart';
import 'package:souq_port_said/data/model/response/homepage_model/popular_dio_model.dart';
import 'package:souq_port_said/utill/app_constants.dart';

class PopularDioRepo{
  final DioClient dioClient;
  PopularDioRepo({required this.dioClient});

  Future<List<PopularDioModel>> getPopularDio() async{
    try{
      Response response = await Dio().get(AppConstants.baseUrl + AppConstants.productList);
      List<PopularDioModel> popularDioList = [];
      for(var item in response.data){
        popularDioList.add(PopularDioModel.fromJson(item));
      }
      return popularDioList;
    } catch(error, stacktrace){
      print("Exception : $error stacktrace: $stacktrace");
      return [];
    }
  }

}