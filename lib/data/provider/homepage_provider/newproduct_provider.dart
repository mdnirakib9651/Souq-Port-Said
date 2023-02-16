import 'package:flutter/cupertino.dart';
import 'package:souq_port_said/data/model/request/homepage_repository/newproducts_repo.dart';
import '../../model/response/homepage_model/newproduct_model.dart';

class NewProductProvider with ChangeNotifier{
  NewProductsRepository newProductsRepository = NewProductsRepository();
  bool loading = false;

  List<NewProductsModel> _newProductList = [];
  List<NewProductsModel> get newProductList => _newProductList;

  getNewListData() async{
    _newProductList = await newProductsRepository.getNewProductListData();
    notifyListeners();
  }

}