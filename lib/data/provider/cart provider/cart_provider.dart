import 'package:flutter/foundation.dart';
import 'package:souq_port_said/data/model/request/cart_repository/cart_repo.dart';
import '../../model/response/card model/card_model.dart';

class CartProvider extends ChangeNotifier{

  final CartRepo cartRepo;
  CartProvider({required this.cartRepo});

  List<CartModel> _cartList = [];
  List<CartModel> get cartList => _cartList;

  double _amount = 0.0;
  double get amount => _amount;

  List<bool> _isSelectedList = [];
  List<bool> get isSelectedList => _isSelectedList;

  bool _isSelectAll = true;
  bool get isSelectedAll => _isSelectAll;

  void getCartData(){
    _cartList = [];
    _cartList.addAll(cartRepo.getCartList());
  }

  void addToCart(CartModel cartModel){
    _cartList.add(cartModel);
    _isSelectedList.add(true);
    cartRepo.addToCartList(_cartList);
    _amount = _amount + (cartModel.newProductsDioModel!.price * cartModel.quantity);
    notifyListeners();
  }

  void removeFromCart(int index) {
    if(_isSelectedList[index]) {
      _amount = _amount - (_cartList[index].newProductsDioModel!.price * _cartList[index].quantity);
    }
    _cartList.removeAt(index);
    _isSelectedList.removeAt(index);
    cartRepo.addToCartList(_cartList);
    notifyListeners();
  }

  void removeCheckoutProduct(List<CartModel> carts) {
    carts.forEach((cart) {
      _amount = _amount - (cart.newProductsDioModel!.price * cart.quantity);
      _cartList.removeWhere((cartModel) => cartModel.newProductsDioModel!.id == cart.newProductsDioModel!.id);
      _isSelectedList.removeWhere((selected) => selected);
    });
    cartRepo.addToCartList(_cartList);
    notifyListeners();
  }

  void setQuantity(bool isIncrement, int index) {
    if (isIncrement) {
      _cartList[index].quantity = _cartList[index].quantity + 1;
      _isSelectedList[index] ? _amount = _amount + _cartList[index].newProductsDioModel!.price : _amount = _amount;
    } else {
      _cartList[index].quantity = _cartList[index].quantity - 1;
      _isSelectedList[index] ? _amount = _amount - _cartList[index].newProductsDioModel!.price : _amount = _amount;
    }
    cartRepo.addToCartList(_cartList);
    notifyListeners();
  }
}