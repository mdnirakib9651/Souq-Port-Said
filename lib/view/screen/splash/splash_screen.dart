import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souq_port_said/data/provider/catagory_provider/catagory_provider.dart';
import 'package:souq_port_said/data/provider/homepage_provider/newproduct_dio_provider.dart';
import 'package:souq_port_said/data/provider/homepage_provider/popular_dio_provider.dart';
import '../../../data/provider/auth provider/auth_provider.dart';
import '../../../data/provider/find provider/brand_provider.dart';
import '../../../data/provider/splash provider/splash_provider.dart';
import '../../../utill/color_resources.dart';
import '../dashboard/deshboard_screen.dart';
import '../signin_in/signin_screen.dart';
import 'widget/splash_printer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ------------->>>> Splash Screen <<<<-----------------

    bool firstTime = true;
    _onConnectivityChanged = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (!firstTime) {
        bool isNotConnected = result != ConnectivityResult.wifi &&
            result != ConnectivityResult.mobile;
        isNotConnected
            ? const SizedBox()
            : ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isNotConnected ? Colors.red : Colors.green,
          duration: Duration(seconds: isNotConnected ? 6000 : 3),
          content: Text(
            isNotConnected ? "No Connection" : "Connected",
            textAlign: TextAlign.center,
          ),
        ));
        if (!isNotConnected) {
          _route();
        }
      }
      firstTime = false;
    });

    _route();

  }

  void _route(){
    Timer(const Duration(seconds: 3), () {
      if(Provider.of<AuthProvider>(context, listen: false).getIsSignIn()){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DeshBoardScreen()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
      }
      Provider.of<SplashProvider>(context, listen: false).initSharedPrefData();
      Provider.of<NewProductDioProvider>(context, listen: false).getNewProductListData();
      Provider.of<PopularDioProvider>(context, listen: false).getPopularListData();
      Provider.of<CatagoryProvider>(context, listen: false).getCatagoryListData();
      Provider.of<BrandProvider>(context, listen: false).getBrand();
      Provider.of<AuthProvider>(context, listen: false).getUserInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorResources.black,
      body: SlashPrinter(),
    );
  }
}


