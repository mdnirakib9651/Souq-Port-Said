import 'package:dio/dio.dart';
import 'package:souq_port_said/data/datasource/romote/dio/dio_client.dart';
import 'package:souq_port_said/data/model/response/homepage_model/newproduct_dio_model.dart';
import 'package:souq_port_said/utill/app_constants.dart';

// class NewProductDioRepo{
//   final DioClient dioClient;
//   NewProductDioRepo({required this.dioClient});
//
//   Future<List<NewProductsDioModel>> getNewProductDio() async{
//     try{
//       Response response = await Dio().get(AppConstants.baseUrl + AppConstants.productList);
//       List<NewProductsDioModel> productList = [];
//       for(var item in response.data){
//         productList.add(NewProductsDioModel.fromJson(item));
//       }
//       return productList;
//     } catch(error, stacktrace){
//       print("Exception : $error stacktrace: $stacktrace");
//       return [];
//     }
//   }
// }

class NewProductDioRepo{
  final DioClient dioClient;
  NewProductDioRepo({required this.dioClient});

  Future<List<NewProductsDioModel>> getNewProductDio() async{
    try{
      Response response = await Dio().get(AppConstants.baseUrl + AppConstants.productList);
      List<NewProductsDioModel> newProductList = [];
      for(var item in response.data){
        newProductList.add(NewProductsDioModel.fromJson(item));
      }
      return newProductList;
    } catch(error, stacktrace){
      print("Exception : $error stacktrace: $stacktrace");
      return [];
    }
  }
}