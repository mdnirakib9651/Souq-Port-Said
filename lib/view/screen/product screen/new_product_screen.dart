// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souq_port_said/data/model/response/card%20model/card_model.dart';
import 'package:souq_port_said/data/model/response/homepage_model/newproduct_dio_model.dart';
import '../../../data/model/response/love model/love_model.dart';
import '../../../data/provider/cart provider/cart_provider.dart';
import '../../../data/provider/love_provider/love_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/custom_themes.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/ubuntu.dart';
import '../../basewidget/Icon Button/iconbutton_widget.dart';
import '../../basewidget/navigator.dart';
import '../../basewidget/snackbar.dart';
import '../cart/cart.dart';

class NewProductScreen extends StatefulWidget {
  NewProductsDioModel? newProductsDioModel;
  NewProductScreen({Key? key, required this.newProductsDioModel}) : super(key: key);

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {

  @override
  Widget build(BuildContext context) {
    // final ch = MediaQuery.of(context).size.height;
    final cw = MediaQuery.of(context).size.width;
    LoveModel love = LoveModel(widget.newProductsDioModel, 1);
    LoveProvider loveProvider = Provider.of<LoveProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: ColorResources.grey,
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
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                onPressed: () {
                  getPageBack(context);
                },
                icon: Image.asset(
                  Images.back,
                  color: ColorResources.white,
                  height: 16,
                  width: 20,
                )
            ),
            actions: [
              Stack(
                children: [
                  IconButtonWidget(image: Images.cart, onTab: () => const MyCartss()),
                  Positioned(top: 6, right: 6,
                      child: Consumer<CartProvider>(builder: (context, cart, child){
                        return CircleAvatar(radius: 7, backgroundColor: ColorResources.red,
                          child: Text(cart.cartList.length.toString(),
                              style: ubuntuSemiBold.copyWith(color: ColorResources.white, fontSize: Dimensions.fontSizeExtraSmall,
                              )),
                        );
                      },)
                  ),
                ],
              ),
              const SizedBox(width: 5,)
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              // height: ch,
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
                              // Text(
                              //   "${widget.newProductsDioModel!.}",
                              //   style: titleHeader.copyWith(
                              //       color: ColorResources.textFontColor),
                              // ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: Dimensions.marginSizeDefault),
                                height: 15,
                                width: 2,
                                color: ColorResources.textFontColor,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                onTap: () {},
                                child: Text(
                                  "${widget.newProductsDioModel!.rating}",
                                  style: titilliumRegular.copyWith(
                                      fontSize: Dimensions.fontSizeLarge,
                                      color: ColorResources.lightSkyBlue,
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                      ColorResources.lightSkyBlue,
                                      decorationThickness: 1),
                                ),
                              ),
                            ],
                          ),

                          Text("\$${widget.newProductsDioModel!.price}",
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(widget.newProductsDioModel!.description,
                                style: titilliumRegular.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,
                                  color: ColorResources.black,
                                )),
                          ),
                          const SizedBox(
                            height: 30,
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
      bottomNavigationBar: Row(
        children: [
          const SizedBox(width: 10,),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: ColorResources.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: (){
                if (loveProvider.isLoved(love)) {
                  loveProvider.removeFromLove(love);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar("Removed From Favourite"));
                } else {
                  loveProvider.addToLove(love);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar("Added To Favourite"));
                }
              },
              child: loveProvider.isLoved(love)
                  ? const Icon(Icons.favorite, color: ColorResources.red,)
                  : const Icon(Icons.favorite_border),
            ),
          ),
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: (){
                CartModel cart = CartModel(widget.newProductsDioModel, 1);
                List<CartModel> cartList = Provider.of<CartProvider>(context, listen: false).cartList;
                bool alreadyInCart = false;
                for (CartModel item in cartList) {
                  if (item.newProductsDioModel!.id == cart.newProductsDioModel!.id) {
                    alreadyInCart = true;
                    break;
                  }
                }
                if (!alreadyInCart) {
                  Provider.of<CartProvider>(context, listen: false).addToCart(cart);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar("Add To Cart"));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar("Item is already in cart"));
                }
              },
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
          ),
          const SizedBox(width: 10, height: 70,)
        ],
      ),
    );
  }
}
