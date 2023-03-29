import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souq_port_said/data/model/response/card%20model/card_model.dart';
import 'package:souq_port_said/data/provider/cart%20provider/cart_popular_provider.dart';
import 'package:souq_port_said/data/provider/cart%20provider/cart_provider.dart';
import 'package:souq_port_said/utill/style/lato_styles.dart';
import 'package:souq_port_said/view/basewidget/order_complete_dialog.dart';
import 'package:souq_port_said/view/screen/cart/widget/cart_widget.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/ubuntu.dart';
import '../../basewidget/Icon Button/iconbutton_widget.dart';
import '../search/search_screen.dart';

class MyCartss extends StatefulWidget {
  final bool fromCheckout;
  final int sellerId;

  const MyCartss({Key? key, this.fromCheckout = false, this.sellerId = 1}) : super(key: key);

  @override
  State<MyCartss> createState() => _MyCartssState();
}

class _MyCartssState extends State<MyCartss> {

  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CartProvider>(context, listen: false).getCartData();
    Provider.of<CartPopularProvider>(context, listen: false).getCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, child){
      double amount = 0.0;
      double shippingAmount = 0.0;
      List<CartModel> cartList = [];
      cartList.addAll(cart.cartList);
      for(int i = 0; i < cart.cartList.length; i++){
        // Calculate the total amount for this item by multiplying the price and quantity
        amount += cart.cartList[i].newProductsDioModel!.price * cart.cartList[i].quantity;
        // Add the item amount to the total amount
      }
      return cartList.isNotEmpty ?
        Scaffold(
          backgroundColor: ColorResources.backGroundColor,
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll){
              overScroll.disallowIndicator();
              return true;
            },
            child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
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
                        mainAxisAlignment: MainAxisAlignment.end,
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
                          const SizedBox(height: 10,),
                          SizedBox(
                            height: MediaQuery.of(context).size.height/2.5,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              itemCount: cartList.length,
                                itemBuilder: (BuildContext context,int index){
                                  return Column(
                                    children: [
                                      CartWidget(cartModel: cartList[index], index: index, fromCheckout: widget.fromCheckout), const SizedBox(height: 10,),
                                    ],
                                  );
                                }),
                          ),
                          const SizedBox(height: 30,),
                          Column(
                            children: [
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
                                    Text("Items(${cartList.length.toString()})", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.grey),),
                                    Text("\$${(amount + shippingAmount).toStringAsFixed(2)}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.grey),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Shipping", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.grey),),
                                    Text("\$$shippingAmount", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.grey),),
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
                                    Text("\$${(amount + shippingAmount).toStringAsFixed(2)}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.textColorFind),),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20,),
                              cartList.isNotEmpty ?
                              Builder(
                                builder: (context) =>
                                 InkWell(
                                  onTap: (){
                                    orderCompleteDialog(context);
                                    Provider.of<CartProvider>(context, listen: false).removeCheckoutProduct(cartList);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                                    child: Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: ColorResources.black,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(child: Text("Check Out", style: latoBold.copyWith(fontSize: Dimensions.fontSizeLarge, color: ColorResources.white),),),
                                    ),
                                  ),
                                ),
                              ) : const SizedBox(),
                            ],
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          )) : Scaffold(
          backgroundColor: ColorResources.backGroundColor,
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll){
              overScroll.disallowIndicator();
              return true;
            },
            child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
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
                        mainAxisAlignment: MainAxisAlignment.end,
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height/2.5,
                            width: MediaQuery.of(context).size.width,
                          ),
                          const SizedBox(height: 30,),
                          Column(
                            children: [
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
                                    Text("\$${(amount + shippingAmount).toStringAsFixed(2)}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.textColorFind),),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Builder(
                                builder: (context) =>
                                    InkWell(
                                      onTap: (){
                                        orderCompleteDialog(context);
                                        Provider.of<CartProvider>(context, listen: false).removeCheckoutProduct(cartList);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                                        child: Container(
                                          height: 60,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: ColorResources.black,
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Center(child: Text("Check Out", style: latoBold.copyWith(fontSize: Dimensions.fontSizeLarge, color: ColorResources.white),),),
                                        ),
                                      ),
                                    ),
                              )
                            ],
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ));
    });
  }
}

