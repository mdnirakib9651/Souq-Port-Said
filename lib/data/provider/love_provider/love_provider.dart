import 'package:flutter/foundation.dart';
import 'package:souq_port_said/data/model/request/love%20repository/love_repository.dart';

import '../../model/response/love model/love_model.dart';

class LoveProvider extends ChangeNotifier{

  final LoveRepository loveRepository;
  LoveProvider({required this.loveRepository});

  List<LoveModel> _loveList = [];
  List<LoveModel> get loveList => _loveList;

  // List<bool> _isSelectedList = [];
  // List<bool> get isSelectedList => _isSelectedList;

  // int _favouriteIndex = -1;
  // int get favouriteIndex => _favouriteIndex;

  void addToLove(LoveModel love) {
    _loveList.add(love);
    notifyListeners();
  }

  void removeFromLove(LoveModel love) {
    _loveList.removeWhere((item) => item.newProductsDioModel!.id == love.newProductsDioModel!.id);
    notifyListeners();
  }

  bool isLoved(LoveModel love) {
    return _loveList.any((item) => item.newProductsDioModel!.id == love.newProductsDioModel!.id);
  }
}