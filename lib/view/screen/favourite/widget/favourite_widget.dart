import 'package:flutter/material.dart';
import 'package:souq_port_said/data/model/response/love%20model/love_model.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/font_size/dimensions.dart';
import '../../../../utill/style/lato_styles.dart';
import '../../product screen/product_screen.dart';

class FavouriteWidget extends StatelessWidget {
  final LoveModel loveModel;
  final int index;
  const FavouriteWidget({Key? key, required this.loveModel, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(newProductsDioModel: loveModel.newProductsDioModel)));
      },
      child: Column(
        children: [
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: ColorResources.underLine,
          ),
          const SizedBox(height: 10,),
          ListTile(
            leading: Image.network(loveModel.newProductsDioModel!.image, height: 100, width: MediaQuery.of(context).size.width / 5,),
            title: Text(loveModel.newProductsDioModel!.title, style: latoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.textFontColor),),
            subtitle: Text(loveModel.newProductsDioModel!.category, style: latoBold.copyWith(fontSize: Dimensions.fontSizeDefault, color: ColorResources.textFontColor),),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("\$${loveModel.newProductsDioModel!.price}", style: latoBold.copyWith(fontSize: Dimensions.fontSizeLarge, color: ColorResources.textFontColor),),
                const Icon(Icons.navigate_next, color: ColorResources.searchLogo,)
              ],
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
