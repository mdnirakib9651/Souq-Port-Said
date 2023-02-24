import 'package:flutter/material.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/ubuntu.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    final ch = MediaQuery.of(context).size.height;
    final cw = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: ColorResources.black,
            expandedHeight: 100,
            elevation: 0,
            // title: Image.asset(Images.appbarLogo,height: 45,width: 216,),
            centerTitle: true,
            pinned: true, // ------>> appbar fixed
            floating: false, //------>> scrollable
            leading: IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.arrow_back)),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                decoration:  BoxDecoration(
                    border: Border.all(width: 2,color: ColorResources.white),
                    color: ColorResources.white,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
                ),
              ),
            ),
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
                  SizedBox(
                    height: ch * .4,
                    width: cw/1.5,
                    //  color: Colors.white,
                    child: Image.asset(Images.nike),
                  ),
                  Container(
                    // height: ch * .5,
                    width: cw,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      color: ColorResources.iconBg,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Altec Lansing Epsilonia Bluetooth Speaker",
                              style: ubuntuRegular.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: ColorResources.black,
                              )),

                          //-------------------------Review section-----------
                          Row(
                            children: [
                              const Icon(
                                Icons.star_outlined,
                                color: ColorResources.splashBorder,
                                size: 15,
                              ),
                              const Icon(
                                Icons.star_outlined,
                                color: ColorResources.splashBorder,
                                size: 15,
                              ),
                              const Icon(
                                Icons.star_outlined,
                                color: ColorResources.splashBorder,
                                size: 15,
                              ),
                              const Icon(
                                Icons.star_outlined,
                                color: ColorResources.splashBorder,
                                size: 15,
                              ),
                              const  Icon(
                                Icons.star_outlined,
                                color: ColorResources.splashBorder,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                "3.8",
                                style: ubuntuSemiBold.copyWith(
                                    color: ColorResources.splashBorder,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 20),
                                height: 15,
                                width: 2,
                                color: ColorResources.textFontColor,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "137 Reviews",
                                  style: ubuntuRegular.copyWith(
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
                              style: ubuntuSemiBold.copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: ColorResources.black,
                              )),

                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 1.5,
                              width: cw,
                              color: ColorResources.chatIconColor,
                            ),
                          ),
                          Text("Select Size",
                              style: ubuntuRegular.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: ColorResources.black,
                              )),

                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 50,
                                            height: 50,
                                            decoration:  BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ColorResources.white,
                                                border: Border.all(width: 1,color: Colors.blue)
                                            ),
                                            child: Text("5",style: ubuntuRegular.copyWith(color: ColorResources.black,fontWeight: FontWeight.w700,fontSize: 14),),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),


                          Text("Select Color",
                              style: ubuntuRegular.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: ColorResources.black,
                              )),

                          const SizedBox(
                            height: 15,
                          ),

                          SizedBox(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 50,
                                            height: 50,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          Text("Specification",
                              style: ubuntuRegular.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: ColorResources.black,
                              )),

                          const SizedBox(
                            height: 15,
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Shown:",
                                  style: ubuntuRegular.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: ColorResources.textCart,
                                  )),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Laser",
                                      style: ubuntuRegular.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: ColorResources.textCart,
                                      )),
                                  const SizedBox(height: 10,),
                                  SizedBox(
                                    width: 180,
                                    child: Expanded(
                                      flex: 2,
                                      child: Text("Blue/Anthracite/Watermelon/White",
                                        style: ubuntuRegular.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: ColorResources.sellerTXT,
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),

                          const SizedBox(
                            height: 25,
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Style:",
                                      style: ubuntuRegular.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: ColorResources.textCart,
                                      )),
                                  const SizedBox(height: 10,),
                                  SizedBox(
                                    width: cw/1.3,
                                    child: Expanded(
                                      flex: 2,
                                      child: Text("The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.",
                                        style: ubuntuRegular.copyWith(
                                          fontSize: Dimensions.fontSizeDefault,
                                          fontWeight: FontWeight.w400,
                                          color: ColorResources.textFontColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),


                              Text("Laser",
                                  style: ubuntuRegular.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: ColorResources.textCart,
                                  )),
                            ],
                          ),

                          const SizedBox(height: 25,),


                          Text("You Might Also Like",
                              style: ubuntuRegular.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: ColorResources.black,
                              )),

                          SizedBox(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SizedBox(
                                      width: 200,
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 200,
                                              decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                                  color: ColorResources.white
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(20),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Image.asset(Images.nike, width: 142, height: 136,),
                                                    const SizedBox(height: 10 ,),
                                                    Text("Md.Nazrul Islam",style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: ColorResources.textFontColor,fontWeight: FontWeight.w800),textAlign: TextAlign.start,),
                                                    const SizedBox(height: 5 ,),
                                                    Text("243",style: ubuntuRegular.copyWith(color: ColorResources.black,fontWeight: FontWeight.w900),),
                                                    const SizedBox(width: 20,),
                                                    Row(
                                                      children: [
                                                        Text("323",style: ubuntuRegular.copyWith(color: ColorResources.textFontColor,fontWeight: FontWeight.w400,decoration: TextDecoration.lineThrough),),
                                                        const SizedBox(width: 10,),
                                                        Text("30%",style: ubuntuRegular.copyWith(color: ColorResources.cerise,fontWeight: FontWeight.w700),),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                          ),
                                          const SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),

                          const SizedBox(height: 20,),
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
                                    Images.nike,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(left: Dimensions.marginSizeLarge),
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: cw * 0.7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: ColorResources.green,),
                                  child: Text(
                                    "ADD TO CART",
                                    style: ubuntuRegular.copyWith(
                                        fontSize: Dimensions.fontSizeLarge,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
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