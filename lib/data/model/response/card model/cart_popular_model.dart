import 'package:souq_port_said/data/model/response/homepage_model/popular_dio_model.dart';

class CartPopularModel{
  PopularDioModel? popularDioModel;
  dynamic quantity;

  CartPopularModel(this.popularDioModel, this.quantity);

  CartPopularModel.fromJson(Map<String, dynamic> json){
    popularDioModel = json['product'] != null ? PopularDioModel.fromJson(json['product']) : null;
    quantity = json['quantity'];
  }
  
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.popularDioModel;
    data['quantity'] = this.quantity;
    return data;
  }
}