import 'package:flutter/material.dart';
import 'package:souq_port_said/data/provider/find%20provider/find_provider.dart';
import 'data/provider/favorurite/favorurite_provider.dart';
import 'data/provider/find provider/findscreen_provider.dart';
import 'data/provider/find provider/findwoman_provider.dart';
import 'data/provider/homepage_provider/newproduct_provider.dart';
import 'data/provider/homepage_provider/popular_provider.dart';
import 'data/provider/homepage_provider/popularapi_provider.dart';
import 'view/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<NewProductProvider>(create: (change) => NewProductProvider()),
        ChangeNotifierProvider<PopularProvider>(create: (change) => PopularProvider()),
        ChangeNotifierProvider<PopularApiProvider>(create: (change) => PopularApiProvider()),
        ChangeNotifierProvider<FindProvider>(create: (change) => FindProvider()),
        ChangeNotifierProvider<FindScreenProvider>(create: (change) => FindScreenProvider()),
        ChangeNotifierProvider<FindWomanProvider>(create: (change) => FindWomanProvider()),
        ChangeNotifierProvider<FavoruriteProvider>(create: (change) => FavoruriteProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
