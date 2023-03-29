import 'package:dio/dio.dart';
import 'package:souq_port_said/data/model/response/find%20product%20model/find_model.dart';
import '../../../../utill/app_constants.dart';
import '../../../../utill/images.dart';
import '../../response/catagory_model/catagory_model.dart';

class FindRepository{
  List<FindModel> findList = [
    FindModel(1, Images.vegetoble, "Frash Fruits & Vegetable",),
    FindModel(1, Images.ghee, "Cooking Oil & Gree",),
    FindModel(1, Images.fish, "Meat & Fish",),
    FindModel(1, Images.snack, "Bokery & Snocks",),
    FindModel(1, Images.eggs, "Dairy & Eggs",),
    FindModel(1, Images.fashion, "Fashion",),
  ];
  Future<List<FindModel>> getFindListData() async{
    return findList;
  }

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