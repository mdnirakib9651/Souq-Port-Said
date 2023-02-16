import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souq_port_said/data/provider/find%20provider/find_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/ubuntu.dart';
import '../../basewidget/Icon Button/iconbutton_widget.dart';
import '../search/search_screen.dart';
import 'findproduct_screen.dart';
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
    findMdl.getFindListData();
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
                        Consumer<FindProvider>(builder: (context, findProduct, child){
                          // ignore: unnecessary_null_comparison
                          return findProduct.findList != null ?
                          GridView.builder(
                            itemCount: findProduct.findList.length,
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
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => FindProductScreen(findModel: findProduct.findList[index],)));
                                },
                                child: findproductWidget(findModel: findProduct.findList[index],),
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
