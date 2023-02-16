import 'package:flutter/cupertino.dart';
import 'package:souq_port_said/data/model/request/find%20repository/find_repo.dart';

import '../../model/response/find product model/find_model.dart';

class FindProvider with ChangeNotifier{
  FindRepository findRepository = FindRepository();
  bool loading = false;

  List<FindModel> _findList = [];
  List<FindModel> get findList => _findList;

  getFindListData() async{
    _findList = await findRepository.getFindListData();
    notifyListeners();
  }
}