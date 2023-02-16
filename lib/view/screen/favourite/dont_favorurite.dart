// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/provider/homepage_provider/newproduct_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/ubuntu.dart';
import '../../basewidget/Icon Button/iconbutton_widget.dart';
import '../homepage/widget/newproduct_widget.dart';
import '../search/search_screen.dart';

class DontFavorurite extends StatefulWidget {
  const DontFavorurite({Key? key}) : super(key: key);

  @override
  State<DontFavorurite> createState() => _DontFavoruriteState();
}

class _DontFavoruriteState extends State<DontFavorurite> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final newProjectMdl = Provider.of<NewProductProvider>(context, listen: false);
    newProjectMdl.getNewListData();
  }
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
                leading: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(Images.drawer),
                ),
                backgroundColor: ColorResources.black,
                expandedHeight: 60,
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Favorurite", style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black),),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          const Icon(Icons.favorite, color: Colors.grey, size: 180,),
                          Text("You don't have any savae items", style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.textFontColor),),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("RECOMMENDED FOR YOU", style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black),),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Consumer<NewProductProvider>(builder: (context, newProduct, child){
                            return newProduct.newProductList != null ?
                            SizedBox(
                              height: 300,
                              child: NotificationListener<OverscrollIndicatorNotification>(
                                onNotification: (overScroll){
                                  overScroll.disallowIndicator();
                                  return true;
                                },
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                                    itemCount: newProduct.newProductList.length,
                                    itemBuilder: (BuildContext context, int index){
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: SizedBox(
                                          width: 160,
                                          child: NewProduct_widget(newProductsModel: newProduct.newProductList[index],),
                                        ),
                                      );
                                    }
                                ),
                              ),
                            ) : const Center(child: CircularProgressIndicator(),);
                          }),
                        ],
                      ),
                    )
                ),
              ),
            ],
          ),
        ));
  }
}
