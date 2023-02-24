import 'package:souq_port_said/data/model/response/newproduct_dio_model.dart';

class LoveModel{
  NewProductsDioModel? newProductsDioModel;
  dynamic quantity;

  LoveModel(this.newProductsDioModel, this.quantity);

  LoveModel.fromJson(Map<String, dynamic> json){
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