import 'package:flutter/cupertino.dart';
import 'package:souq_port_said/data/model/request/find%20repository/find_repo.dart';

import '../../model/response/catagory_model/catagory_model.dart';
import '../../model/response/find product model/find_model.dart';

class FindProvider with ChangeNotifier{
  FindRepository findRepository = FindRepository();
  bool loading = false;

  List<FindModel> _findList = [];
  List<FindModel> get findList => _findList;

  List<CategoryModel> _catagoryList = [];
  List<CategoryModel> get catagoryList => _catagoryList;

  Future<void> getFindListData() async{
    _findList = await findRepository.getFindListData();
    notifyListeners();
  }

  Future<void> getCatagoryList() async{
    _catagoryList = await findRepository.getCatagory();
    print("Catagory : $_catagoryList");
    notifyListeners();
  }

}