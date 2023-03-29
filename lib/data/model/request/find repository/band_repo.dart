import 'package:dio/dio.dart';
import 'package:souq_port_said/data/datasource/romote/dio/dio_client.dart';
import 'package:souq_port_said/data/model/response/find%20product%20model/brand_model.dart';
import 'package:souq_port_said/utill/app_constants.dart';

class BrandRepo{
  final DioClient dioClient;

  BrandRepo({required this.dioClient});

  Future<List<BrandModel>> getBrandList() async{
    try{
      Response response = await Dio().get(AppConstants.shopMaxBaseUrl + AppConstants.brand);
      List<BrandModel> brandList = [];
      for(var brand in response.data){
        brandList.add(BrandModel.fromJson(brand));
      }
      return brandList;
    } catch(error, stacktrace){
      print("Exception : $error stacktrace: $stacktrace");
      return [];
    }
  }
}