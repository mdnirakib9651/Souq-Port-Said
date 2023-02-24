import 'package:flutter/material.dart';
import 'package:souq_port_said/data/provider/cart%20provider/cart_provider.dart';
import 'package:souq_port_said/data/provider/find%20provider/find_provider.dart';
import 'package:souq_port_said/data/provider/newproduct_dio_provider.dart';
import 'package:souq_port_said/data/provider/splash%20provider/splash_provider.dart';
import 'data/provider/favorurite/favorurite_provider.dart';
import 'data/provider/find provider/findscreen_provider.dart';
import 'data/provider/find provider/findwoman_provider.dart';
import 'data/provider/homepage_provider/newproduct_provider.dart';
import 'data/provider/homepage_provider/popular_provider.dart';
import 'data/provider/homepage_provider/popularapi_provider.dart';
import 'data/provider/love_provider/love_provider.dart';
import 'view/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'di_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<NewProductDioProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<CartProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<LoveProvider>()),
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
