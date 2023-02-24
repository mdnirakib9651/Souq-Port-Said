// ignore_for_file: unnecessary_null_comparison, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/model/response/newproduct_dio_model.dart';
import '../../../data/provider/cart provider/cart_provider.dart';
import '../../../data/provider/homepage_provider/newproduct_provider.dart';
import '../../../data/provider/newproduct_dio_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/ubuntu.dart';
import '../../basewidget/Icon Button/iconbutton_widget.dart';
import '../cart/cart.dart';
import '../homepage/widget/newproduct_widget.dart';
import '../product screen/product_screen.dart';
import '../search/search_screen.dart';

class DontFavorurite extends StatefulWidget {
  const DontFavorurite({Key? key}) : super(key: key);

  @override
  State<DontFavorurite> createState() => _DontFavoruriteState();
}

class _DontFavoruriteState extends State<DontFavorurite> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final newProjectMdl = Provider.of<NewProductProvider>(context, listen: false);
    newProjectMdl.getNewListData();
  }

  _loading(BuildContext context){
    Provider.of<NewProductDioProvider>(context, listen: false).getNewProductListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.backGroundColor,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll){
            overScroll.disallowIndicator();
            return true;
          },
          child: RefreshIndicator(
            onRefresh: () async{
              await _loading(context);
            },
            child: CustomScrollView(
              slivers: [
                // ------------>>> AppBar <<<----------------
                SliverAppBar(
                  leading: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(Images.drawer),
                  ),
                  backgroundColor: ColorResources.black,
                  expandedHeight: 60,
                  title: Image.asset(Images.appBarTitle, height: 45, width: 216,),
                  centerTitle: true,
                  actions: [
                    IconButtonWidget(image: Images.search, onTab: () => const SearchScreen()), // --->> Search Screen
                    Stack(
                      children: [
                        IconButtonWidget(image: Images.cart, onTab: () => const MyCartss()),
                        Positioned(
                            top: 6,
                            right: 6,
                            child: Consumer<CartProvider>(builder: (context, cart, child){
                              return CircleAvatar(radius: 7, backgroundColor: ColorResources.red,
                                child: Text(cart.cartList.length.toString(),
                                    style: ubuntuSemiBold.copyWith(color: ColorResources.white, fontSize: Dimensions.fontSizeExtraSmall,
                                    )),
                              );
                            },)
                        ),
                      ],
                    ), // --->> Search Screen
                    const SizedBox(width: 5,)
                  ],
                  floating: false, // --->> Scroable
                  pinned: true, // --->> AppBar Fixed
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(20),
                    child: Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: ColorResources.backGroundColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
                      ),
                    ),
                  ),
                ),
                NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll){
                    overScroll.disallowIndicator();
                    return true;
                  },
                  child: SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Favorurite", style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black),),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            const Icon(Icons.favorite, color: Colors.grey, size: 180,),
                            Text("You don't have any save items", style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.textFontColor),),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("RECOMMENDED FOR YOU", style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black),),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Consumer<NewProductDioProvider>(builder: (context, newDioProduct, child){
                              // ignore: unnecessary_null_comparison
                              List<NewProductsDioModel> productDioList;
                              productDioList = newDioProduct.newProductDioList;
                              return productDioList.isNotEmpty ?
                              SizedBox(
                                height: 300,
                                child: NotificationListener<OverscrollIndicatorNotification>(
                                  onNotification: (overScroll){
                                    overScroll.disallowIndicator();
                                    return true;
                                  },
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                                      itemCount: productDioList.length,
                                      itemBuilder: (BuildContext context, int index){
                                        return InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(newProductsDioModel: productDioList[index],)));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: SizedBox(
                                              width: 160,
                                              child: NewProduct_widget(newProductsDioModel: productDioList[index],),
                                            ),
                                          ),
                                        );
                                      }
                                  ),
                                ),
                              ) : const Center(child: CircularProgressIndicator(),);
                            }),
                          ],
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
