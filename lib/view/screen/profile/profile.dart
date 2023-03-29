import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souq_port_said/data/provider/auth%20provider/auth_provider.dart';
import 'package:souq_port_said/utill/style/lato_styles.dart';
import '../../../data/provider/cart provider/cart_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/ubuntu.dart';
import '../../basewidget/Icon Button/iconbutton_widget.dart';
import '../cart/cart.dart';
import '../search/search_screen.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  _loading(BuildContext context){
    Provider.of<AuthProvider>(context, listen: false).getUserInfo();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).getUserInfo();
    String token = Provider.of<AuthProvider>(context, listen: false).getToken();
    debugPrint("<<<<<<<<<<<<<<<<Toke>>>>>>>>>>>>>> $token");
  }
  @override
  Widget build(BuildContext context) {
    // final profileModel = Provider.of<AuthProvider>(context);
    return RefreshIndicator(
      onRefresh: () async{
        await _loading(context);
      },
      child: Consumer<AuthProvider>(builder: (context, profile, child){
        return profile.user!=null ? Scaffold(
            backgroundColor: ColorResources.backGroundColor,
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll){
                overScroll.disallowIndicator();
                return true;
              },
              child: CustomScrollView(
                slivers: [
                  // ------------->>> AppBar <<<----------------
                  SliverAppBar(
                    backgroundColor: ColorResources.black,
                    expandedHeight: 60,
                    leading: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(Images.drawer),
                    ),
                    title: Image.asset(Images.appBarTitle, height: 45, width: 216,),
                    centerTitle: true,
                    actions: [
                      IconButtonWidget(image: Images.search, onTab: () => const SearchScreen()), // --->> Search Screen
                      Stack(
                        children: [
                          IconButtonWidget(image: Images.cart, onTab: () => const MyCartss()),
                          Positioned(
                              top: 6,
                              right: 6,
                              child: Consumer<CartProvider>(builder: (context, cart, child){
                                return CircleAvatar(radius: 7, backgroundColor: ColorResources.red,
                                  child: Text(cart.cartList.length.toString(),
                                      style: ubuntuSemiBold.copyWith(color: ColorResources.white, fontSize: Dimensions.fontSizeExtraSmall,
                                      )),
                                );
                              },)
                          ),
                        ],
                      ), // --->> Search Screen
                      const SizedBox(width: 5,)
                    ],
                    floating: false, // --->> Scroable
                    pinned: true, // --->> AppBar Fixed
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(20),
                      child: Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color: ColorResources.backGroundColor,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
                        ),
                      ),
                    ),
                  ),
                  NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll){
                      overScroll.disallowIndicator();
                      return true;
                    },
                    child: SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.close)),
                                Text("Profile", style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 72,
                                        width: 72,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorResources.grey,
                                        ),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child: Image.asset(Images.profile1, fit: BoxFit.cover,)),
                                      ),
                                      const SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${profile.user!.firstName} ${profile.user!.lastName}", style: latoBold.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge, ),),
                                          const SizedBox(height: 10,),
                                          Text(profile.user!.email, style: latoBold.copyWith(color: Colors.grey, fontSize: Dimensions.fontSizeLarge, ),),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 50,),
                                  Container(
                                    height: 300,
                                    width: MediaQuery.of(context).size.width,
                                    color: ColorResources.white,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: const Icon(Icons.female),
                                          title: Text("Gender", style: latoBold.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text("Male", style: latoBold.copyWith(color: Colors.grey, fontSize: Dimensions.fontSizeLarge),),
                                              const Icon(Icons.navigate_next, color: Colors.grey,)
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.date_range),
                                          title: Text("Birthday", style: latoBold.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text("12-12-2000", style: latoBold.copyWith(color: Colors.grey, fontSize: Dimensions.fontSizeLarge),),
                                              const Icon(Icons.navigate_next, color: Colors.grey,)
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.email),
                                          title: Text("Emain", style: latoBold.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(profile.user!.email, style: latoBold.copyWith(color: Colors.grey, fontSize: Dimensions.fontSizeLarge),),
                                              const Icon(Icons.navigate_next, color: Colors.grey,)
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.phone_android),
                                          title: Text("Phone Number", style: latoBold.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(profile.user!.mobile, style: latoBold.copyWith(color: Colors.grey, fontSize: Dimensions.fontSizeLarge),),
                                              const Icon(Icons.navigate_next, color: Colors.grey,)
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.lock),
                                          title: Text("Change Password", style: latoBold.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("*************", style: latoBold.copyWith(color: Colors.grey, fontSize: Dimensions.fontSizeLarge),),
                                              const Icon(Icons.navigate_next, color: Colors.grey,)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            )):const Center(child: CircularProgressIndicator());

      }),
    );
  }
}
