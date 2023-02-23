import 'package:flutter/cupertino.dart';
import 'package:souq_port_said/data/model/request/newproduct_dio_repo.dart';

import '../model/response/newproduct_dio_model.dart';

// class NewProductDioProvider extends ChangeNotifier{
//   final NewProductDioRepo newProductDioRepo;
//   NewProductDioProvider({required this.newProductDioRepo});
//
//   List<NewProductsDioModel> _newProductDioList = [];
//   List<NewProductsDioModel> get newProductDioList => _newProductDioList;
//
//   void getNewProductDioListData() async{
//     _newProductDioList.clear();
//     _newProductDioList = await newProductDioRepo.getNewProductDio();
//     print("Product : ${_newProductDioList.length}");
//     print(newProductDioList);
//     notifyListeners();
//   }
// }

class NewProductDioProvider extends ChangeNotifier{
  final NewProductDioRepo newProductDioRepo;
  NewProductDioProvider({required this.newProductDioRepo});

  List<NewProductsDioModel> _newProductDioList = [];
  List<NewProductsDioModel> get newProductDioList => _newProductDioList;

  void getNewProductListData() async{
    _newProductDioList.clear();
    _newProductDioList = await newProductDioRepo.getNewProductDio();
    print("Product ${newProductDioList.length}");
    print(newProductDioList);
    notifyListeners();
  }
}