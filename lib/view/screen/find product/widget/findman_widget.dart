// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/cupertino.dart';

import '../../../../data/model/response/find product model/findscreen_model.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/font_size/dimensions.dart';
import '../../../../utill/style/lato_styles.dart';

class findman_widget extends StatelessWidget {

  findScreenModel? findScreenmodel;

  findman_widget({super.key, this.findScreenmodel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorResources.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Image.asset("${findScreenmodel!.image}"),
          ),
        ),
        const SizedBox(height: 10,),
        Text("${findScreenmodel!.title}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: ColorResources.black,),textAlign: TextAlign.center,),
      ],
    );
  }
}