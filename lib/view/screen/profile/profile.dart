import 'package:flutter/material.dart';
import 'package:souq_port_said/utill/style/lato_styles.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/ubuntu.dart';
import '../../basewidget/Icon Button/iconbutton_widget.dart';
import '../search/search_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  IconButtonWidget(image: Images.cart, onTab: (){}),
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
                                      color: Colors.red,
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image.asset(Images.profile1, fit: BoxFit.cover,)),
                                  ),
                                  const SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Mazimus Gold", style: latoBold.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge, ),),
                                      const SizedBox(height: 10,),
                                      Text("@deriaxy", style: latoBold.copyWith(color: Colors.grey, fontSize: Dimensions.fontSizeLarge, ),),
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
                                      leading: Padding(
                                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                                        child: Image.asset(Images.gender,),
                                      ),
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
                                      leading: Padding(
                                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                                        child: Image.asset(Images.birthday),
                                      ),
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
                                      leading: Padding(
                                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                                        child: Image.asset(Images.email,),
                                      ),
                                      title: Text("Emain", style: latoBold.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("md.rakib3248@gmail.com", style: latoBold.copyWith(color: Colors.grey, fontSize: Dimensions.fontSizeLarge),),
                                          const Icon(Icons.navigate_next, color: Colors.grey,)
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                      leading: Padding(
                                        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                                        child: Image.asset(Images.phone, height: 20, width: 12, fit: BoxFit.fill,),
                                      ),
                                      title: Text("Phone Number", style: latoBold.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("01858949651", style: latoBold.copyWith(color: Colors.grey, fontSize: Dimensions.fontSizeLarge),),
                                          const Icon(Icons.navigate_next, color: Colors.grey,)
                                        ],
                                      ),
                                    ),
                                    ListTile(
                                      leading: Padding(
                                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                                        child: Image.asset(Images.change, ),
                                      ),
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
        ));
  }
}
