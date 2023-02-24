import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/model/response/card model/card_model.dart';
import '../../../../data/provider/cart provider/cart_provider.dart';
import '../../../../utill/color_resources.dart';

class QuantityButton extends StatelessWidget {
  final CartModel cartModel;
  final bool isIncrement;
  final int quantity;
  final int index;
  final int maxQty;
  const QuantityButton({Key? key,
    required this.cartModel,
    required this.isIncrement,
    required this.quantity,
    required this.index,
    required this.maxQty}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(!isIncrement && quantity > 1){
          Provider.of<CartProvider>(context, listen: false).setQuantity(false, index);
        }
        else if(isIncrement && quantity < maxQty){
          Provider.of<CartProvider>(context, listen: false).setQuantity(true, index);
        }
      },
      child: Container(
        height: 30,
        width: 35,
        decoration: BoxDecoration(
          border: Border.all(color: ColorResources.grey),
        ),
        child: Icon(
          isIncrement ? Icons.add : Icons.remove,
          color: isIncrement
              ? quantity >= maxQty
              ? ColorResources.grey
              : ColorResources.black
              : quantity > 1
              ? ColorResources.black
              : ColorResources.grey,
          size: 30,
        ),
      ),
    );
  }
}