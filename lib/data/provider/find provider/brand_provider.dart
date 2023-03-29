import 'package:flutter/cupertino.dart';
import 'package:souq_port_said/data/model/request/find%20repository/band_repo.dart';

import '../../model/response/find product model/brand_model.dart';

class BrandProvider with ChangeNotifier{
  final BrandRepo brandRepo;

  BrandProvider({required this.brandRepo});

  List<BrandModel> _brandList = [];
  List<BrandModel> get brandList => _brandList;

  Future<void> getBrand() async{
    _brandList = await brandRepo.getBrandList();
    print("Brand length${_brandList.length}");
    print("Brand $_brandList");
    print("----------------------->>>>>>>>>>>>>Brand End<<<<<<<<<<---------------------");
    notifyListeners();
  }

}