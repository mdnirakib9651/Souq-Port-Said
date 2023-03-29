import 'package:flutter/cupertino.dart';
import 'package:souq_port_said/data/model/request/cart_repository/cart_popular_repo.dart';

import '../../model/response/card model/cart_popular_model.dart';

class CartPopularProvider extends ChangeNotifier{
  final CartPopularRepo cartPopularRepo;
  CartPopularProvider({required this.cartPopularRepo});

  List<CartPopularModel> _cartList = [];
  List<CartPopularModel> get cartList => _cartList;

  double _amount = 0.0;
  double get amount => _amount;

  List<bool> _isSelectedList = [];
  List<bool> get isSelectedList => _isSelectedList;

  bool _isSelectAll = true;
  bool get isSelectedAll => _isSelectAll;
  
  void getCartData(){
    _cartList = [];
    _cartList.addAll(cartPopularRepo.getCartPopularList());
  }
  
  void addToCart(CartPopularModel cartPopularModel){
    _cartList.add(cartPopularModel);
    _isSelectedList.add(true);
    cartPopularRepo.addToCartList(_cartList);
    _amount = _amount + (cartPopularModel.popularDioModel!.price * cartPopularModel.quantity);
    notifyListeners();
  }
  
  void removeFromCart(int index){
    if(_isSelectedList[index]){
      _amount = _amount - (_cartList[index].popularDioModel!.price * _cartList[index].quantity);
    }
    _cartList.removeAt(index);
    _isSelectedList.removeAt(index);
    cartPopularRepo.addToCartList(_cartList);
    notifyListeners();
  }

  void removeCheckoutProduct(List<CartPopularModel> carts){
    carts.forEach((cart) {
      _amount = _amount - (cart.popularDioModel!.price * cart.quantity);
      _cartList.removeWhere((cartModel) => cartModel.popularDioModel!.id == cart.popularDioModel!.id);
      _isSelectedList.removeWhere((selected) => selected);
    });
    cartPopularRepo.addToCartList(_cartList);
    notifyListeners();
  }

  void setQuantity(bool isIncrement, int index){
    if(isIncrement){
      _cartList[index].quantity = _cartList[index].quantity + 1;
      _isSelectedList[index] ? _amount = _amount + _cartList[index].popularDioModel!.price : _amount = _amount;
    } else{
      _cartList[index].quantity = _cartList[index].quantity -1;
      _isSelectedList[index] ? _amount = _amount - _cartList[index].popularDioModel!.price : _amount = _amount;
    }
    cartPopularRepo.addToCartList(_cartList);
    notifyListeners();
  }

}