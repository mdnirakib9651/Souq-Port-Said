// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../../data/model/response/homepage_model/newproduct_model.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/font_size/dimensions.dart';
import '../../../../utill/style/ubuntu.dart';

// ignore: camel_case_types
class NewProduct_widget extends StatelessWidget {

  NewProductsModel? newProductsModel;
  NewProduct_widget({
    super.key,
    this.newProductsModel
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            // height: 200,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorResources.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.paddingSizeDefault,right: Dimensions.paddingSizeDefault),
                      child: Icon(Icons.favorite_border),
                    ),
                  ],
                ),
                Image.asset("${newProductsModel!.image}", height: 140, width: 150,),
              ],
            ),
          ),
          const SizedBox(height: 9,),
          Text("${newProductsModel!.productName}",style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeLarge,color: ColorResources.textFontColor),textAlign: TextAlign.center,),
          const SizedBox(height: 5,),
          Text("\$${newProductsModel!.price}",style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black,),)
        ]
    );
  }
}