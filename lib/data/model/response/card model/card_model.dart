import 'package:souq_port_said/data/model/response/homepage_model/newproduct_dio_model.dart';

class CartModel{
  NewProductsDioModel? newProductsDioModel;
  dynamic quantity;

  CartModel(this.newProductsDioModel, this.quantity);

  CartModel.fromJson(Map<String, dynamic> json){
    newProductsDioModel = json['product'] != null ? NewProductsDioModel.fromJson(json['product']) : null;
    quantity = json['quantity'];

  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.newProductsDioModel;
    data['quantity'] = this.quantity;
    return data;
  }
}