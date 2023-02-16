// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import '../../../../data/model/response/find product model/find_model.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/font_size/dimensions.dart';
import '../../../../utill/style/ubuntu.dart';

// ignore: must_be_immutable
class findproductWidget extends StatelessWidget {
  FindModel findModel;
  findproductWidget({
    super.key,
    required this.findModel
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: ColorResources.gridFindBackColor,
      ),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Image(image: AssetImage("${findModel.image}"), height: 94.9, width: 131.38,),
          const SizedBox(height: 20,),
          SizedBox(
              width: 100,
              child: Text("${findModel.title}",style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge,color: ColorResources.black),textAlign: TextAlign.center,))
        ],
      ),
    );
  }
}
