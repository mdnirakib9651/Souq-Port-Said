import 'package:flutter/cupertino.dart';
import 'package:souq_port_said/data/model/request/favorurite%20repository/favorurite_repo.dart';

import '../../model/response/favorurite model/favorurite_model.dart';

class FavoruriteProvider with ChangeNotifier{
  FavoruriteRepository favoruriteRepository = FavoruriteRepository();
  bool loading = false;

  List<FavoruriteModel> _favoruriteList = [];
  List<FavoruriteModel> get favoruriteList => _favoruriteList;

  getFavoruriteListData() async{
    _favoruriteList = await favoruriteRepository.getFavoruriteListData();
    notifyListeners();
  }
}