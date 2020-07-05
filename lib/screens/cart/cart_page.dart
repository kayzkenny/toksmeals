import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toksmeals/models/cart.dart';
import 'package:toksmeals/screens/cart/cart_item_card.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        if (cart.cart.length == 0) {
          return Center(
            child: Text('Nothing in your cart'),
          );
        } else {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Text('Total: \u{20A6}${cart.total}'),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cart.cart.length,
                  itemBuilder: (context, index) {
                    return CartItemCard(menuItem: cart.cart[index]);
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
