import 'package:souq_port_said/data/model/response/favorurite%20model/favorurite_model.dart';

import '../../../../utill/images.dart';

class FavoruriteRepository{
  List<FavoruriteModel> favoruriteList = [
    FavoruriteModel(Images.sprite, "Sprite Can", "325ml, price", "1.50"),
    FavoruriteModel(Images.diet, "Sprite Can", "355ml, price", "1.99"),
    FavoruriteModel(Images.appleJuice, "Apple & Grape Juice", "21, price", "15.50"),
    FavoruriteModel(Images.cocaCola, "Coca Cola Can", "325ml, price", "1.50"),
    FavoruriteModel(Images.pepsiCan, "Pepsi Can", "325ml, price", "1.50"),
  ];
  Future<List<FavoruriteModel>> getFavoruriteListData() async{
    return favoruriteList;
  }
}