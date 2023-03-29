import 'package:flutter/widgets.dart';
import 'package:souq_port_said/data/model/request/homepage_repository/popular_dio_repo.dart';

import '../../model/response/homepage_model/popular_dio_model.dart';

class PopularDioProvider extends ChangeNotifier{
  final PopularDioRepo popularDioRepo;
  PopularDioProvider({required this.popularDioRepo});

  List<PopularDioModel> _popularDioList = [];
  List<PopularDioModel> get popularDioList => _popularDioList;

  void getPopularListData() async{
    _popularDioList.clear();
    _popularDioList = await popularDioRepo.getPopularDio();
    print("Popular Product ${popularDioList.length}");
    print(popularDioList);
    notifyListeners();
  }
}