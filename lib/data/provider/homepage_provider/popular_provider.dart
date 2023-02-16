import 'package:flutter/cupertino.dart';
import 'package:souq_port_said/data/model/request/homepage_repository/popular_repo.dart';

import '../../model/response/homepage_model/popular_model.dart';

class PopularProvider with ChangeNotifier{
  PopularRepository popularRepository = PopularRepository();
  bool loading = false;

  List<PopularModel> _popularList = [];
  List<PopularModel> get popularList => _popularList;

  getPopularListData() async{
    _popularList = await popularRepository.getPopularListData();
    notifyListeners();
  }

}