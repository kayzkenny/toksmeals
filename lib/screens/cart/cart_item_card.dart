import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toksmeals/models/cart.dart';
import 'package:toksmeals/models/menu_item.dart';

class CartItemCard extends StatelessWidget {
  final MenuItem menuItem;
  CartItemCard({this.menuItem});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImage(menuItem.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(menuItem.name),
                  subtitle: Text(
                    '\u{20A6}${menuItem.price} , Quantity: ${menuItem.quantity}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            int index = cart.getMenuItemIndex(menuItem);
                            cart.increaseQuantity(index);
                          },
                          child: Icon(
                            Icons.add_circle_outline,
                            size: 35.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            int index = cart.getMenuItemIndex(menuItem);
                            cart.decreaseQuantity(index);
                          },
                          child: Icon(
                            Icons.remove_circle_outline,
                            size: 35.0,
                          ),
                        ),
                      ],
                    ),
                    FlatButton(
                      child: const Text(
                        'REMOVE',
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        cart.removeFromCart(menuItem);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
