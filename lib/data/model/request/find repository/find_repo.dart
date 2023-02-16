import 'package:souq_port_said/data/model/response/find%20product%20model/find_model.dart';
import '../../../../utill/images.dart';

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
}