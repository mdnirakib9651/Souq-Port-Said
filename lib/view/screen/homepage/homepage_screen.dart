import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souq_port_said/data/model/response/homepage_model/newproduct_dio_model.dart';
import 'package:souq_port_said/data/model/response/homepage_model/popular_dio_model.dart';
import 'package:souq_port_said/data/provider/homepage_provider/popularapi_provider.dart';
import 'package:souq_port_said/data/provider/homepage_provider/newproduct_dio_provider.dart';
import 'package:souq_port_said/utill/color_resources.dart';
import 'package:souq_port_said/utill/font_size/dimensions.dart';
import 'package:souq_port_said/utill/images.dart';
import 'package:souq_port_said/view/basewidget/Icon%20Button/iconbutton_widget.dart';
import '../../../data/provider/cart provider/cart_provider.dart';
import '../../../data/provider/homepage_provider/newproduct_provider.dart';
import '../../../data/provider/homepage_provider/popular_dio_provider.dart';
import '../../../data/provider/homepage_provider/popular_provider.dart';
import '../../../utill/style/lato_styles.dart';
import '../../../utill/style/ubuntu.dart';
import '../cart/cart.dart';
import '../product screen/popular_product_screen.dart';
import '../product screen/new_product_screen.dart';
import '../search/search_screen.dart';
import 'widget/newproduct_widget.dart';

// ignore: camel_case_types
class homePageScreen extends StatefulWidget {
  const homePageScreen({Key? key}) : super(key: key);

  @override
  State<homePageScreen> createState() => _homePageScreenState();
}

// ignore: camel_case_types
class _homePageScreenState extends State<homePageScreen> {

  bool isFavourite = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final newProjectMdl = Provider.of<NewProductProvider>(context, listen: false);
    final popularMdl = Provider.of<PopularProvider>(context, listen: false);
    final popularApiMdl = Provider.of<PopularApiProvider>(context, listen: false);
    newProjectMdl.getNewListData();
    popularMdl.getPopularListData();
    popularApiMdl.getPopularApiListData(context);
  }

  _loading(BuildContext context){
    Provider.of<NewProductDioProvider>(context, listen: false).getNewProductListData();
    Provider.of<PopularDioProvider>(context, listen: false).getPopularListData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
              controller: _scrollController,
              slivers: [
                // ------------>>> AppBar <<<----------------
                SliverAppBar(
                  backgroundColor: ColorResources.black,
                  expandedHeight: 288,
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
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: ColorResources.backGroundColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
                      ),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    title: Row(
                        children: [
                      Image.asset(Images.sliverImage, height: 240, width: 120,), // --->> Slider Image
                      const SizedBox(width: 10,),
                      Expanded(
                        flex: 2,
                        child: SingleChildScrollView(
                          child: SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                const SizedBox(height: 10,),
                                Text("Beats by Dre",
                                    style: ubuntuRegular.copyWith(
                                        fontSize: Dimensions.fontSizeExtraSmall,
                                        fontWeight: FontWeight.w400,
                                        color: ColorResources.white)),
                                SizedBox(
                                  height: 72,
                                  width: 143,
                                  child: SingleChildScrollView(
                                    physics: const NeverScrollableScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Beats Solo3 Wireless",
                                            style: ubuntuRegular.copyWith(
                                                fontSize: Dimensions.splashExtraLarge,
                                                fontWeight: FontWeight.w900,
                                                color: ColorResources.white)),
                                        Text("€ 319.90",
                                            style: ubuntuRegular.copyWith(
                                                fontSize: Dimensions.fontSizeSmall,
                                                fontWeight: FontWeight.w900,
                                                color: ColorResources.white)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
                    titlePadding: const EdgeInsets.only(top: 170),
                  ),
                ),

                NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll){
                    overScroll.disallowIndicator();
                    return true;
                  },
                  child: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        // ------------------>> New Products <<--------------------
                        Padding(
                          padding: const EdgeInsets.only(left: 32, right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("New Products", style: ubuntuHeader.copyWith(fontWeight:FontWeight.w900, fontSize: Dimensions.fontSizeExtraLarge),),
                                  TextButton(
                                      onPressed: (){},
                                      child: Text("See All", style: latoRegular.copyWith(fontWeight:FontWeight.w900, fontSize: Dimensions.fontSizeExtraLarge, color: Colors.grey),),)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Consumer<NewProductDioProvider>(builder: (context, newDioProduct, child){
                          // ignore: unnecessary_null_comparison
                          List<NewProductsDioModel> productDioList;
                          productDioList = newDioProduct.newProductDioList;
                          return productDioList.isNotEmpty ?
                          SizedBox(
                            height: 280,
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
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewProductScreen(newProductsDioModel: productDioList[index],)));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: SizedBox(
                                          width: 160,
                                          child: NewProduct_widget(newProductsDioModel: productDioList[index]),
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ) : const Center(child: CircularProgressIndicator(),);
                        }),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            height: 2,
                            width: MediaQuery.of(context).size.width,
                            color: ColorResources.underLine,
                          ),
                        ),
                        // ---------------->> Popular <<-------------------
                        Padding(
                          padding: const EdgeInsets.only(top: 18, left: 32, right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Popular", style: ubuntuHeader.copyWith(fontWeight:FontWeight.w900, fontSize: Dimensions.fontSizeExtraLarge),),
                                  TextButton(
                                    onPressed: (){},
                                    child: Text("See All", style: latoRegular.copyWith(fontWeight:FontWeight.w900, fontSize: Dimensions.fontSizeExtraLarge, color: Colors.grey),),)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Consumer<PopularDioProvider>(builder: (context, popularProduct, child){
                          List<PopularDioModel> productDioList;
                          productDioList = popularProduct.popularDioList;
                          return productDioList.isNotEmpty ?
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: GridView.builder(
                              shrinkWrap: true,
                              primary: false,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                mainAxisExtent: 280,
                              ),
                                scrollDirection: Axis.vertical,
                                padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                                itemCount: productDioList.length,
                                itemBuilder: (BuildContext context, int index){
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PopularProductScreen(popularDioModel: productDioList[index],)));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: SizedBox(
                                        width: 160,
                                        child: Column(
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
                                                  Image.network(productDioList[index].image, height: 140, width: 150,),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 9,),
                                            Flexible(
                                                child: Text(productDioList[index].title, style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeLarge,color: ColorResources.textFontColor, overflow: TextOverflow.ellipsis),textAlign: TextAlign.center, maxLines: 2,)),
                                            const SizedBox(height: 5,),
                                            Text("\$${productDioList[index].price}",style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ): const Center(child: CircularProgressIndicator(),);
                        }),
                        const SizedBox(height: 10,),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width,
                          color: ColorResources.underLine,
                        ),

                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

