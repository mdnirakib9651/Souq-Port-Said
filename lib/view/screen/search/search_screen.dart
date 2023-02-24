import 'package:flutter/material.dart';
import 'package:souq_port_said/utill/color_resources.dart';
import 'package:souq_port_said/utill/style/heebo_styles.dart';
import 'package:souq_port_said/utill/style/ubuntu.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  String search = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorResources.searchBackGroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: ColorResources.searchBackGroundColor,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: ColorResources.black,),
            ),
            title: Text("Search", style: ubuntuRegular.copyWith(fontWeight: FontWeight.w800, fontSize: 18, color: ColorResources.black),),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: searchKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        controller: searchController,
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: "Search Categories, Products",
                          hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: ColorResources.hindSearch),
                          contentPadding: EdgeInsets.symmetric(horizontal: 30),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.grey,),
                        ),
                      ),
                    )),

                Padding(
                  padding: const EdgeInsets.only(left: 31, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const FindProduct()));
                          },
                          child: Text("Popular", style: heebooReguler.copyWith(fontWeight: FontWeight.w800, fontSize: 22, color: ColorResources.black,),),),
                      const SizedBox(height: 18,),
                      Text("Apple MacBook Pro", style: heebooReguler.copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: ColorResources.hindSearch,),),
                      const SizedBox(height: 14,),
                      Text("Beats3", style: heebooReguler.copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: ColorResources.hindSearch,),),
                      const SizedBox(height: 14,),
                      Text("Apple Watch", style: heebooReguler.copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: ColorResources.hindSearch,),),
                      const SizedBox(height: 14,),
                      Text("Speakers", style: heebooReguler.copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: ColorResources.hindSearch,),),
                      const SizedBox(height: 14,),
                      Text("Harman Kardon", style: heebooReguler.copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: ColorResources.hindSearch,),),
                      const SizedBox(height: 14,),
                      Text("AirPods3", style: heebooReguler.copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: ColorResources.hindSearch,),),
                    ],
                  ))
              ]
            ),
          )
        ]
      ),
    );
  }
}
