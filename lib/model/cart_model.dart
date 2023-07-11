import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ['Avocado', '4.00', 'lib/images/image0.png', Colors.green],
    ['Banana', '2.00', 'lib/images/image1.png', Colors.yellow],
    ['Chicken', '7.30', 'lib/images/image2.png', Colors.brown],
    ['Water', '1.50', 'lib/images/image3.png', Colors.blue]
  ];
  get shopItems => _shopItems;

  final List _cartItems = [];
  get cartItems => _cartItems;

  void addItemToCart(int index) {
    cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double total = 0;
    for (final cartPrice in _cartItems) {
      total += double.parse(cartPrice[1]);
    }
    return total.toStringAsFixed(2);
  }
}
