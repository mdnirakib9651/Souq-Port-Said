import 'package:flutter/material.dart';
import 'package:souq_port_said/utill/style/lato_styles.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/ubuntu.dart';
import '../../basewidget/Icon Button/iconbutton_widget.dart';
import '../search/search_screen.dart';

class MyCartss extends StatefulWidget {
  const MyCartss({Key? key}) : super(key: key);

  @override
  State<MyCartss> createState() => _MyCartssState();
}

class _MyCartssState extends State<MyCartss> {

  int count = 0;

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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Your Cart", style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black),),
                            ],
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
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.favorite, color: ColorResources.red, size: 30,),
                                        SizedBox(width: 10,),
                                        Icon(Icons.delete_outline, size: 30,)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              count--;
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: ColorResources.grey),
                                            ),
                                            child: const Icon(Icons.remove, color: Colors.grey,),
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 35,
                                          decoration: const BoxDecoration(
                                            color: ColorResources.grey
                                          ),
                                          child: Center(child: Text("$count", style: latoRegular.copyWith(color: Colors.grey, fontSize: Dimensions.fontSizeLarge),)),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              count++;
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: ColorResources.grey),
                                            ),
                                            child: const Icon(Icons.add, color: Colors.grey,),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 25,),
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
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.favorite, color: ColorResources.red, size: 30,),
                                        SizedBox(width: 10,),
                                        Icon(Icons.delete_outline, size: 30,)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              count--;
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: ColorResources.grey),
                                            ),
                                            child: const Icon(Icons.remove, color: Colors.grey,),
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 35,
                                          decoration: const BoxDecoration(
                                              color: ColorResources.grey
                                          ),
                                          child: Center(child: Text("$count", style: latoRegular.copyWith(color: Colors.grey, fontSize: Dimensions.fontSizeLarge),)),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              count++;
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: ColorResources.grey),
                                            ),
                                            child: const Icon(Icons.add, color: Colors.grey,),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 10,),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter Cupon Code",
                                  hintStyle: latoRegular.copyWith(color: Colors.grey,),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black,
                                    )
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                      )
                                  )
                                ),
                              ),
                            ),
                            Container(
                              height: 55,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: ColorResources.iconNextFavourite,
                              ),
                              child: Center(
                                child: Text("Apply", style: latoBold.copyWith(color: ColorResources.white),),),
                            ),
                            const SizedBox(width: 5,),
                          ],
                        ),
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
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: ColorResources.black,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(child: Text("Check Out", style: latoBold.copyWith(fontSize: Dimensions.fontSizeLarge, color: ColorResources.white),),),
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
