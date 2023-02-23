// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:souq_port_said/data/model/response/newproduct_dio_model.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/custom_themes.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../basewidget/navigator.dart';

class ProductScreen extends StatefulWidget {
  NewProductsDioModel? newProductsDioModel;
  ProductScreen({Key? key, required this.newProductsDioModel}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    // final ch = MediaQuery.of(context).size.height;
    final cw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: ColorResources.black,
            expandedHeight: 50,
            elevation: 0,
            // title: Image.asset(Images.appbarLogo,height: 45,width: 216,),
            centerTitle: true,
            pinned: true, // ------>> appbar fixed
            floating: false, //------>> scrollable
            leading: IconButton(
                onPressed: () {
                  getPageBack(context);
                },
                icon: Image.asset(
                  Images.back,
                  color: ColorResources.white,
                  height: 16,
                  width: 20,
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              //height: ch,
              width: cw,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  //---------------------Images section---------------
                  Image.network(widget.newProductsDioModel!.image,height: MediaQuery.of(context).size.height * .4, width: MediaQuery.of(context).size.width / 1.3,),
                  Container(
                    // height: ch * .5,
                    width: cw,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      color: ColorResources.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: Dimensions.paddingSizeLarge,
                        left: Dimensions.paddingSizeLarge,
                        right: Dimensions.paddingSizeLarge,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.newProductsDioModel!.title,
                              style: titilliumRegular.copyWith(
                                fontSize: Dimensions.fontSizeOverLarge,
                                color: ColorResources.black,
                              )),

                          //-------------------------Review section-----------
                          Row(
                            children: [
                              const Icon(
                                Icons.star_outlined,
                                color: ColorResources.splashBorder,
                              ),
                              const Icon(
                                Icons.star_outlined,
                                color: ColorResources.splashBorder,
                              ),
                              const Icon(
                                Icons.star_outlined,
                                color: ColorResources.splashBorder,
                              ),
                              const Icon(
                                Icons.star_outlined,
                                color: ColorResources.textFontColor,
                              ),
                              const Icon(
                                Icons.star_outlined,
                                color: ColorResources.textFontColor,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                "3.8",
                                style: titleHeader.copyWith(
                                    color: ColorResources.textFontColor),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: Dimensions.marginSizeDefault),
                                height: 15,
                                width: 2,
                                color: ColorResources.textFontColor,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "137 Reviews",
                                  style: titilliumRegular.copyWith(
                                      fontSize: Dimensions.fontSizeLarge,
                                      color: ColorResources.lightSkyBlue,
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                      ColorResources.lightSkyBlue,
                                      decorationThickness: 5),
                                ),
                              ),
                            ],
                          ),

                          Text("\$210.00",
                              style: titilliumBold.copyWith(
                                fontSize: Dimensions.fontSizeOverLarge,
                                color: ColorResources.black,
                              )),

                          const SizedBox(
                            height: 20,
                          ),

                          Container(
                            height: 2,
                            width: cw,
                            color: ColorResources.chatIconColor,
                          ),

                          //-------------------------------Description section------------
                          const SizedBox(
                            height: 20,
                          ),
                          Text("Description",
                              style: titleRegular.copyWith(
                                fontSize: Dimensions.fontSizeOverLarge,
                                color: ColorResources.black,
                              )),

                          const SizedBox(
                            height: 10,
                          ),
                          Text("Bluetooth Connection : Yes",
                              style: titilliumRegular.copyWith(
                                fontSize: Dimensions.fontSizeLarge,
                                color: ColorResources.black,
                              )),
                          Text("Water Resistance: No",
                              style: titilliumRegular.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,
                                  color: ColorResources.black,
                                  height: 2)),
                          Text("NFC (Near Field Communication): Yes",
                              style: titilliumRegular.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,
                                  color: ColorResources.black,
                                  height: 2)),

                          const SizedBox(
                            height: 30,
                          ),

                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      Dimensions.paddingSizeSmall),
                                  child: Image.asset(
                                    Images.favourite,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: Dimensions.marginSizeLarge),
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: cw * 0.7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: ColorResources.green,
                                  ),
                                  child: Text(
                                    "ADD TO CART",
                                    style: titilliumBold.copyWith(
                                        fontSize: Dimensions.fontSizeLarge,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
