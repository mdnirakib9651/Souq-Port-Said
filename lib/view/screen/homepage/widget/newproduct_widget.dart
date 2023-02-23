// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:souq_port_said/data/model/response/newproduct_dio_model.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/font_size/dimensions.dart';
import '../../../../utill/style/ubuntu.dart';

// ignore: camel_case_types
class NewProduct_widget extends StatelessWidget {

  NewProductsDioModel? newProductsDioModel;
  NewProduct_widget({
    super.key,
    this.newProductsDioModel
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
                Image.network(newProductsDioModel!.image, height: 140, width: 150,),
              ],
            ),
          ),
          const SizedBox(height: 9,),
          Flexible(
              child: Text(newProductsDioModel!.title,style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeLarge,color: ColorResources.textFontColor, overflow: TextOverflow.ellipsis,),textAlign: TextAlign.center, maxLines: 2,)),
          const SizedBox(height: 5,),
          Text("\$${newProductsDioModel!.price}",style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black,),)
        ]
    );
  }
}