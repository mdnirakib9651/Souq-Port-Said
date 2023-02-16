import 'dart:async';
import 'package:flutter/material.dart';
import '../../../utill/color_resources.dart';
import '../dashboard/navigationbar_screen.dart';
import '../signin_in/signin_screen.dart';
import 'widget/splash_printer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ------------->>>> Splash Screen <<<<-----------------
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignInScreen()));
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


