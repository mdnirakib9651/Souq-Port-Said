import 'package:flutter/cupertino.dart';

import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';

class SlashPrinter extends StatelessWidget {
  const SlashPrinter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 180,
          width: 187,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: ColorResources.splashBorder,
                  width: 3
              )
          ),
          child: Image.asset(Images.splashLogo)),
    );
  }
}