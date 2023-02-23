import 'package:flutter/cupertino.dart';

import '../../model/request/splash repository/splash_repo.dart';

class SplashProvider extends ChangeNotifier {
  final SplashRepo splashRepo;
  SplashProvider({required this.splashRepo});

  void initSharedPrefData() {
    splashRepo.initSharedData();
  }
}