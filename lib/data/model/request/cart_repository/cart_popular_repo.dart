import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_port_said/data/datasource/romote/dio/dio_client.dart';
import 'package:souq_port_said/data/model/response/card%20model/cart_popular_model.dart';
import 'package:souq_port_said/utill/app_constants.dart';

class CartPopularRepo{
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  CartPopularRepo({required this.dioClient, required this.sharedPreferences});

  List<CartPopularModel> getCartPopularList(){
    List<String>? carts = sharedPreferences.getStringList(AppConstants.cartList);
    List<CartPopularModel> cartList = [];
    carts!.forEach((cart) => cartList.add(CartPopularModel.fromJson(jsonDecode(cart))));
    return cartList;
  }

  void addToCartList(List<CartPopularModel> cartPopularList){
    List<String> carts = [];
    cartPopularList.forEach((cartPopularModel) => carts.add(jsonEncode(cartPopularModel)));
    sharedPreferences.setStringList(AppConstants.cartList, carts);
  }
}