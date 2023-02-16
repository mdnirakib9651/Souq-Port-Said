import 'package:flutter/cupertino.dart';
import 'package:souq_port_said/data/model/request/homepage_repository/popularapi_repo.dart';
import 'package:souq_port_said/data/model/response/homepage_model/popularapi_model.dart';

class PopularApiProvider with ChangeNotifier{

  PopularApiRepository? popularApiRepository = PopularApiRepository();
  bool loading = false;

  List<PopularApiModel>? _popularApiList;
  List<PopularApiModel>? get popularApiList => _popularApiList;

  getPopularApiListData (context) async{
    loading = true;
    _popularApiList = await popularApiRepository!.getPopularListData(context);
    loading = false;
    notifyListeners();
  }

}
