// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/cupertino.dart';

import '../../../../data/model/response/find product model/findwoman_model.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/font_size/dimensions.dart';
import '../../../../utill/style/lato_styles.dart';

// ignore: must_be_immutable
class findWomanWidget extends StatelessWidget {

  FindWoman_model? findWoman_model;
  findWomanWidget({super.key, this.findWoman_model});

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
            child: Image.asset("${findWoman_model!.image}"),
          ),
        ),
        const SizedBox(height: 10,),
        Text("${findWoman_model!.title}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: ColorResources.black), textAlign: TextAlign.center,),
      ],
    );
  }
}