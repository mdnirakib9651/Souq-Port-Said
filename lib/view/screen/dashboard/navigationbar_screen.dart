import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../favourite/favourite.dart';
import '../homepage/homepage_screen.dart';
import '../order_details/orderdetails_screen.dart';
import '../profile/profile.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {

  int currentTab = 0;
  final List<Widget> screens = [
    const homePageScreen(),
    const OrderDetailsScreen(),
    const Favourite(),
    const ProfileScreen()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const homePageScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.white,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: SizedBox(
        height: 66,
        width: 66,
        child: FloatingActionButton(
          backgroundColor: ColorResources.flateColor,
          onPressed: (){
            // Get.to(const CardScreen());
          },
            child: Image.asset(Images.menu, color: ColorResources.white, height: 20, width: 20,)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              //Left Site
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = const homePageScreen();
                      currentTab = 0;
                    });
                  },
                  child: Image.asset(Images.home, color: currentTab == 0 ? ColorResources.black : Colors.grey, height: 18, width: 20.15,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = const OrderDetailsScreen();
                      currentTab = 1;
                    });
                  },
                    child: Image.asset(Images.tag, color: currentTab == 1 ? ColorResources.black : Colors.grey, height: 18, width: 20.15,)
                ),
              ),
              //Right Site
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = const Favourite();
                      currentTab = 2;
                    });
                  },
                    child: Image.asset(Images.favourite, color: currentTab == 2 ? ColorResources.black : Colors.grey, height: 18, width: 20.15,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = const ProfileScreen();
                      currentTab = 3;
                    });
                  },
                    child: Image.asset(Images.profile, color: currentTab == 3 ? ColorResources.black : Colors.grey, height: 18, width: 20.15,)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
