import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souq_port_said/data/provider/favorurite/favorurite_provider.dart';
import 'package:souq_port_said/utill/color_resources.dart';
import 'package:souq_port_said/utill/images.dart';
import 'package:souq_port_said/utill/style/lato_styles.dart';
import 'package:souq_port_said/view/basewidget/Icon%20Button/iconbutton_widget.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/style/ubuntu.dart';
import '../search/search_screen.dart';
import 'dont_favorurite.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final favoruriteMdl = Provider.of<FavoruriteProvider>(context, listen: false);
    favoruriteMdl.getFavoruriteListData();
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
          child: CustomScrollView(
            slivers: [
              // ------------->>> AppBar <<<----------------
              SliverAppBar(
                backgroundColor: ColorResources.black,
                expandedHeight: 60,
                leading: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(Images.drawer),
                ),
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.close)),
                            Text("Favorurite", style: ubuntuHeader.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black),),
                          ],
                        ),
                        Consumer<FavoruriteProvider>(builder: (context, favorurite, child){
                          return SizedBox(
                            height: MediaQuery.of(context).size.height - 225,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                itemCount: favorurite.favoruriteList.length,
                                itemBuilder: (BuildContext context, int index){
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DontFavorurite()));
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
                                          leading: Image.asset("${favorurite.favoruriteList[index].image}"),
                                          title: Text("${favorurite.favoruriteList[index].title}", style: latoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.textFontColor),),
                                          subtitle: Text("${favorurite.favoruriteList[index].subtitle}", style: latoBold.copyWith(fontSize: Dimensions.fontSizeDefault, color: ColorResources.textFontColor),),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("\$${favorurite.favoruriteList[index].price}", style: latoBold.copyWith(fontSize: Dimensions.fontSizeLarge, color: ColorResources.textFontColor),),
                                              const Icon(Icons.navigate_next, color: ColorResources.searchLogo,)
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                      ],
                                    ),
                                  );
                                }),
                          );
                        })
                      ],
                    )
                ),
              ),
            ],
          ),
        ));
  }
}
