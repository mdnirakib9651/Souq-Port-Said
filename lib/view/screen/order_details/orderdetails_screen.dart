import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/lato_styles.dart';
import '../../../utill/style/ubuntu.dart';
import '../../basewidget/Icon Button/iconbutton_widget.dart';
import '../search/search_screen.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
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
              // ------------>>> AppBar <<<----------------
              SliverAppBar(
                backgroundColor: ColorResources.black,
                expandedHeight: 60,
                title: Image.asset(Images.appBarTitle, height: 45, width: 216,),
                centerTitle: true,
                actions: [
                  IconButtonWidget(image: Images.search, onTab: () => const SearchScreen()), // --->> Search Screen
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.close)),
                            Text("Order Details", style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black),)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product", style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black),),
                              Container(
                                height: 125,
                                width: MediaQuery.of(context).size.width,
                                color: ColorResources.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(Images.nike),
                                          const SizedBox(width: 10,),
                                          SizedBox(
                                              width: MediaQuery.of(context).size.width / 2.6,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Nike Air Zoom Progosus 36 Maima", style: latoBold.copyWith(color: ColorResources.textCart, fontSize: Dimensions.fontSizeLarge),),
                                                  Text("\$299.43", style: latoBold.copyWith(color: ColorResources.textColorFind, fontSize: Dimensions.fontSizeLarge),),
                                                ],
                                              )
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: const [
                                            Icon(Icons.favorite, color: ColorResources.red, size: 30,),
                                        ],
                                      )
                                    ],
                                  )
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Container(
                                height: 125,
                                width: MediaQuery.of(context).size.width,
                                color: ColorResources.white,
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(Images.nike),
                                            const SizedBox(width: 10,),
                                            SizedBox(
                                                width: MediaQuery.of(context).size.width / 2.6,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Nike Air Zoom Progosus 36 Maima", style: latoBold.copyWith(color: ColorResources.textCart, fontSize: Dimensions.fontSizeLarge),),
                                                    Text("\$299.43", style: latoBold.copyWith(color: ColorResources.textColorFind, fontSize: Dimensions.fontSizeLarge),),
                                                  ],
                                                )
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Icon(Icons.favorite, color: ColorResources.red, size: 30,),
                                          ],
                                        )
                                      ],
                                    )
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Text("Payment Details", style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black),),
                              const SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Items(3)", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.grey),),
                                    Text("\$598.85", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.grey),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Shipping", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.grey),),
                                    Text("\$40.85", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.grey),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Import Chargers", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.grey),),
                                    Text("\$120.85", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.grey),),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total Price", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black),),
                                    Text("\$763.85", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.textColorFind),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                ),
              ),
            ],
          ),
        ));
  }
}
