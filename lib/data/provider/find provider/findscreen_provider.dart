import 'package:flutter/cupertino.dart';
import 'package:souq_port_said/data/model/request/find%20repository/findscreen_repo.dart';
import '../../model/response/find product model/findscreen_model.dart';

class FindScreenProvider with ChangeNotifier{
  FindScreenRepository findScreenRepository = FindScreenRepository();
  bool loading = false;

  List<findScreenModel> _findScreenList = [];
  List<findScreenModel> get findScreenList => _findScreenList;

  getFindScreenListData() async{
    _findScreenList = await findScreenRepository.getFindScreenListData();
    notifyListeners();
  }
}