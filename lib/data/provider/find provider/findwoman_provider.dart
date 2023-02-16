import 'package:flutter/cupertino.dart';
import 'package:souq_port_said/data/model/request/find%20repository/findwoman_repo.dart';

import '../../model/response/find product model/findwoman_model.dart';

class FindWomanProvider with ChangeNotifier{
  FindWoman_Repository findWoman_Repository = FindWoman_Repository();
  bool loading = false;

  List<FindWoman_model>  _findWomanList = [];
  List<FindWoman_model> get findWomanList => _findWomanList;

  getFindWomanListData() async{
    _findWomanList = await findWoman_Repository.getFindWomanListData();
    notifyListeners();
  }
}