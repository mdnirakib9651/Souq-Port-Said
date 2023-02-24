import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souq_port_said/data/model/response/love%20model/love_model.dart';
import 'package:souq_port_said/data/provider/favorurite/favorurite_provider.dart';
import 'package:souq_port_said/data/provider/love_provider/love_provider.dart';
import 'package:souq_port_said/utill/color_resources.dart';
import 'package:souq_port_said/utill/images.dart';
import 'package:souq_port_said/utill/style/lato_styles.dart';
import 'package:souq_port_said/view/basewidget/Icon%20Button/iconbutton_widget.dart';
import 'package:souq_port_said/view/screen/favourite/widget/favourite_widget.dart';
import '../../../data/provider/cart provider/cart_provider.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/style/ubuntu.dart';
import '../cart/cart.dart';
import '../search/search_screen.dart';
import 'dont_favorurite.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final favoruriteMdl = Provider.of<FavoruriteProvider>(context, listen: false);
    favoruriteMdl.getFavoruriteListData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoveProvider>(builder: (context, love, child){
      List<LoveModel> loveList = [];
      loveList.addAll(love.loveList);
      return loveList.isNotEmpty ?
      Scaffold(
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
                        IconButtonWidget(image: Images.cart, onTab: () => MyCartss()),
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
                              Text("Favorurite", style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black),),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height - 225,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                itemCount: loveList.length,
                                itemBuilder: (BuildContext context, int index){
                                  return FavouriteWidget(
                                      loveModel: loveList[index],
                                      index: index,
                                  );
                                }),
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          )) : const DontFavorurite();
    });
  }
}
