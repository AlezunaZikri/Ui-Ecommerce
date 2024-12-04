import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/model/Product.dart';

class CartProvider extends ChangeNotifier {

  final List<Cart> _listCart = [
    Cart(product: demoProducts[0], numOfItem: 2),
    Cart(product: demoProducts[1], numOfItem: 1),
    Cart(product: demoProducts[3], numOfItem: 1),
  ];

  List<Cart> get cartItems => _listCart; 

  void removeCartItem(Cart cartItems){
    _listCart.removeWhere((item) => item.product.id == cartItems.product.id);
    notifyListeners();
  }
  void addCartItem(Cart cartItem){
    final index = _listCart.indexWhere((item) => item.product.id == cartItem.product.id);

    if (index != -1) {
      _listCart[index].numOfItem += cartItem.numOfItem;
    } else {
      _listCart.add(cartItem);
    }
    notifyListeners();
  }

}