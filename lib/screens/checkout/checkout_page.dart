import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toksmeals/models/cart.dart';
import 'package:toksmeals/models/user.dart';
import 'package:toksmeals/screens/account/user_data_card.dart';
import 'package:toksmeals/services/database.dart';
import 'package:toksmeals/shared/loading.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Confirm your delivery details',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: SingleChildScrollView(
                          child: UserDataCard(userData: userData)),
                      onTap: () => Navigator.pushNamed(context, '/accountForm'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Consumer<Cart>(builder: (context, cart, child) {
                        return Text('Total: \u{20A6}${cart.total}');
                      }),
                    ),
                    RaisedButton(
                      child: Text('Place Order'),
                      textColor: Colors.white,
                      // TODO: Add Orders Page
                      onPressed: () async {
                        final cart = Provider.of<Cart>(context, listen: false);
                        await DatabaseService(uid: user.uid)
                            .placeOrder(cart: cart.cart, total: cart.total);
                        Navigator.pushNamed(context, '/receipt');
                      },
                      padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                      color: Colors.teal[300],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
