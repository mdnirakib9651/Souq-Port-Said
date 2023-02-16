import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souq_port_said/utill/font_size/dimensions.dart';
import 'package:souq_port_said/utill/style/lato_styles.dart';
import 'package:souq_port_said/view/screen/find%20product/widget/findwoman_widget.dart';
import '../../../data/model/response/find product model/find_model.dart';
import '../../../data/provider/find provider/findscreen_provider.dart';
import '../../../data/provider/find provider/findwoman_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../basewidget/Icon Button/iconbutton_widget.dart';
import '../search/search_screen.dart';
import 'widget/findman_widget.dart';

// ignore: must_be_immutable
class FindProductScreen extends StatefulWidget {

  FindModel? findModel;
  FindProductScreen({Key? key, this.findModel}) : super(key: key);

  @override
  State<FindProductScreen> createState() => _FindProductScreenState();
}

class _FindProductScreenState extends State<FindProductScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final findScreenMdl = Provider.of<FindScreenProvider>(context, listen: false);
    final findWomanMdl = Provider.of<FindWomanProvider>(context, listen: false);
    findScreenMdl.getFindScreenListData();
    findWomanMdl.getFindWomanListData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                expandedHeight: 88,
                title: Image.asset(Images.appBarTitle, height: 45, width: 216,),
                centerTitle: true,
                actions: [
                  IconButtonWidget(image: Images.search, onTab: () => const SearchScreen()), // --->> Search Screen
                  IconButtonWidget(image: Images.cart, onTab: (){}),
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
              ),
              NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll){
                  overScroll.disallowIndicator();
                  return true;
                },
                child: SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image.asset("${widget.findModel!.image}", height: 70, width: 99,),
                              SizedBox(
                                height: 40,
                                  width: 80,
                                  child: Text("${widget.findModel!.title}", style: latoBold.copyWith(fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w700, color: ColorResources.textColorFind,), textAlign: TextAlign.center,)),
                            ],
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: 8,
                            color: ColorResources.underLineFind,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 2,
                                color: ColorResources.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("ALL PRODUCTS", style: latoBold.copyWith(fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w700, color: ColorResources.textColorFind,)),
                                      const Icon(Icons.navigate_next, color: ColorResources.black,),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                height: 8,
                                width: MediaQuery.of(context).size.width /1.5 - 50,
                                color: ColorResources.underLineFind,
                              ),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text("Man Fashion", style: latoBold.copyWith(fontWeight: FontWeight.w700, fontSize: Dimensions.fontSizeLarge, color: ColorResources.textColorFind)),
                              ),
                              Consumer<FindScreenProvider>(builder: (context, findScreen, child){
                                // ignore: unnecessary_null_comparison
                                return findScreen.findScreenList != null ?
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: SizedBox(
                                    height: 300,
                                    width: MediaQuery.of(context).size.width /1.5 - 10,
                                    child: GridView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: findScreen.findScreenList.length,
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 8,
                                          mainAxisExtent: 120,
                                        ),
                                        itemBuilder: (BuildContext context, int index){
                                          return findman_widget(findScreenmodel: findScreen.findScreenList[index],);
                                        }),
                                  ),
                                ) : const Center(child: CircularProgressIndicator(),);
                              }),
                              const SizedBox(height: 10,),
                              Container(
                                height: 8,
                                width: MediaQuery.of(context).size.width /1.5 - 50,
                                color: ColorResources.underLineFind,
                              ),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text("Woman Fashion", style: latoBold.copyWith(fontWeight: FontWeight.w700, fontSize: Dimensions.fontSizeLarge, color: ColorResources.textColorFind)),
                              ),
                              Consumer<FindWomanProvider>(builder: (context, findWoman, child){
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: SizedBox(
                                    height: 300,
                                    width: MediaQuery.of(context).size.width /1.5 - 10,
                                    child: GridView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: findWoman.findWomanList.length,
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 8,
                                          mainAxisExtent: 120,
                                        ),
                                        itemBuilder: (BuildContext context, int index){
                                          return findWomanWidget(findWoman_model: findWoman.findWomanList[index]);
                                        }),
                                  ),
                                );
                              })
                            ],
                          )
                        ],
                      ),
                    )
                ),
              ),
            ],
          ),
        ));
  }
}
