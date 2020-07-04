import 'package:flutter/cupertino.dart';

import 'menu_item.dart';

class Cart extends ChangeNotifier {
  List<MenuItem> cart = [];

  void addToCart(MenuItem menuItem) {
    if (cart.contains(menuItem)) {
      var index = cart.indexOf(menuItem);
      increaseQuantity(index);
    } else {
      cart.add(menuItem);
    }
    notifyListeners();
  }

  void removeFromCart(MenuItem menuItem) {
    cart.remove(menuItem);
    notifyListeners();
  }

  void increaseQuantity(int index) {
    cart[index].quantity++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    cart[index].quantity == 1
        ? removeFromCart(cart[index])
        : cart[index].quantity--;
    notifyListeners();
  }

  int get total {
    int cartTotal = 0;
    cart.forEach(
        (menuItem) => (cartTotal += menuItem.price * menuItem.quantity));
    return cartTotal;
  }
}
