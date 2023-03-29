import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souq_port_said/data/model/response/card%20model/card_model.dart';
import 'package:souq_port_said/data/provider/cart%20provider/cart_provider.dart';
import 'package:souq_port_said/view/screen/cart/widget/quantity_button.dart';
import '../../../../data/model/response/love model/love_model.dart';
import '../../../../data/provider/love_provider/love_provider.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/font_size/dimensions.dart';
import '../../../../utill/style/lato_styles.dart';
import '../../../basewidget/snackbar.dart';
import '../../product screen/new_product_screen.dart';

class CartWidget extends StatelessWidget {
  final CartModel cartModel;
  final int index;
  final bool fromCheckout;
  const CartWidget({Key? key, required this.cartModel, required this.index, required this.fromCheckout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoveModel love = LoveModel(cartModel.newProductsDioModel, 1);
    LoveProvider loveProvider = Provider.of<LoveProvider>(context, listen: false);
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewProductScreen(newProductsDioModel: cartModel.newProductsDioModel)));
      },
      child: Container(
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
                  Image.network(cartModel.newProductsDioModel!.image, height: 100, width: MediaQuery.of(context).size.width / 5,),
                  const SizedBox(width: 10,),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(child: Text(cartModel.newProductsDioModel!.title, style: latoBold.copyWith(color: ColorResources.textCart, fontSize: Dimensions.fontSizeLarge, overflow: TextOverflow.ellipsis),maxLines: 3,)),
                          Text("\$${cartModel.newProductsDioModel!.price}", style: latoBold.copyWith(color: ColorResources.textColorFind, fontSize: Dimensions.fontSizeLarge),),
                        ],
                      )
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
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
                      const SizedBox(width: 10,),
                      !fromCheckout ?
                      InkWell(
                        onTap: (){
                          Provider.of<CartProvider>(context, listen: false).removeFromCart(index);
                        },
                        child: const Icon(Icons.delete_outline, size: 30,),
                      ) : const SizedBox.shrink(),
                    ],
                  ),
                  Row(
                    children: [
                      QuantityButton(
                          cartModel: cartModel,
                          isIncrement: false,
                          quantity: cartModel.quantity,
                          index: index,
                          maxQty: 20
                      ),
                      Container(
                        height: 30,
                        width: 35,
                        decoration: const BoxDecoration(
                            color: ColorResources.grey
                        ),
                        child: Center(child: Text(cartModel.quantity.toString(), style: latoRegular.copyWith(color: Colors.grey, fontSize: Dimensions.fontSizeLarge),)),
                      ),
                      QuantityButton(
                          cartModel: cartModel,
                          isIncrement: true,
                          quantity: cartModel.quantity,
                          index: index,
                          maxQty: 20)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


