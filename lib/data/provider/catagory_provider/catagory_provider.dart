import 'package:flutter/cupertino.dart';
import 'package:souq_port_said/data/model/request/catatory_repository/category_repo.dart';

import '../../model/response/catagory_model/catagory_model.dart';

class CatagoryProvider extends ChangeNotifier{
  final CatagoryRepo catagoryRepo;
  CatagoryProvider({required this.catagoryRepo});

  List<CategoryModel> _catagoryList = [];
  List<CategoryModel> get catagoryList => _catagoryList;

  void getCatagoryListData() async{
    _catagoryList.clear();
    _catagoryList = await catagoryRepo.getCatagory();
    print("Catagory ${catagoryList.length}");
    print(catagoryList);
    notifyListeners();
  }
}