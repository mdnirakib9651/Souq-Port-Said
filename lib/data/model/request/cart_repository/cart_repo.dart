import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_port_said/data/datasource/romote/dio/dio_client.dart';
import 'package:souq_port_said/utill/app_constants.dart';
import '../../response/card model/card_model.dart';

class CartRepo{
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  CartRepo({required this.dioClient, required this.sharedPreferences});

  List<CartModel> getCartList(){
    List<String>? carts = sharedPreferences.getStringList(AppConstants.cartList);
    List<CartModel> cartList = [];
    carts!.forEach((cart) => cartList.add(CartModel.fromJson(jsonDecode(cart))));
    return cartList;
  }

  void addToCartList(List<CartModel> cartProductList){
    List<String> carts = [];
    cartProductList.forEach((cartModel) => carts.add(jsonEncode(cartModel)));
    sharedPreferences.setStringList(AppConstants.cartList, carts);
  }
}