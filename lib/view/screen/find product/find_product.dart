import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souq_port_said/data/provider/find%20provider/find_provider.dart';
import '../../../data/provider/find provider/brand_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/ubuntu.dart';
import '../../basewidget/Icon Button/iconbutton_widget.dart';
import '../search/search_screen.dart';
import 'widget/findproduct_widget.dart';

class FindProduct extends StatefulWidget {

  const FindProduct({Key? key}) : super(key: key);

  @override
  State<FindProduct> createState() => _FindProductState();
}

class _FindProductState extends State<FindProduct> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final findMdl = Provider.of<FindProvider>(context, listen: false);
    findMdl.getCatagoryList();
    Provider.of<BrandProvider>(context, listen: false).getBrand();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.black,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll){
            overScroll.disallowIndicator();
            return true;
          },
          child: CustomScrollView(
            slivers: [
              // ------------>>> AppBar <<<----------------
              SliverAppBar(
                backgroundColor: ColorResources.black,
                expandedHeight: 50,
                title: Image.asset(Images.appBarTitle, height: 45, width: 216,),
                centerTitle: true,
                actions: [
                  IconButtonWidget(image: Images.search, onTab: () => const SearchScreen()), // --->> Search Screen
                  IconButtonWidget(image: Images.cart, onTab: (){}),
                ],
                floating: false, // --->> Scroable
                pinned: true, // --->> AppBar Fixed
              ),

              NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll){
                  overScroll.disallowIndicator();
                  return true;
                },
                child: SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Find Products",style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeOverLarge,color: ColorResources.white),),
                        Consumer<BrandProvider>(builder: (context, bandProduct, child){
                          // ignore: unnecessary_null_comparison
                          return bandProduct.brandList != null ?
                          GridView.builder(
                            itemCount: bandProduct.brandList.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              mainAxisExtent: 200,
                            ),
                            primary: false,
                            shrinkWrap: true, // --->> Show Page
                            itemBuilder: (context,int index){
                              return InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => FindProductScreen(findModel: findProduct.findList[index],)));
                                },
                                child: findproductWidget(bandModel: bandProduct.brandList[index],),
                              );
                            },
                          ) : const Center(child: CircularProgressIndicator(),);
                        },)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
