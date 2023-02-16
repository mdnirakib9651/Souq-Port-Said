import 'package:souq_port_said/data/model/response/find%20product%20model/findscreen_model.dart';

import '../../../../utill/images.dart';

class FindScreenRepository{
  List<findScreenModel> findScreenList = [
    findScreenModel(1, Images.shirt, "Man Shirt",),
    findScreenModel(1, Images.equipment, "Man work Equipment",),
    findScreenModel(1, Images.tShirt, "Man T-Shirt",),
    findScreenModel(1, Images.shoes, "Man Shoes",),
    findScreenModel(1, Images.pants, "Man Pants",),
    findScreenModel(1, Images.underwear, "Man Underwear",),
  ];
  Future<List<findScreenModel>> getFindScreenListData() async{
    return findScreenList;
  }
}