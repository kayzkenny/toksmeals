import 'package:toksmeals/screens/checkout/checkout_page.dart';
import 'package:toksmeals/screens/account/account_page.dart';
import 'package:toksmeals/screens/cart/cart_page.dart';
import 'package:toksmeals/screens/home/menu_page.dart';
import 'package:toksmeals/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    MenuPage(),
    CartPage(),
    CheckoutPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('Toks Meals'),
          backgroundColor: Colors.teal[300],
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'logout',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
          bottom: _selectedIndex == 0
              ? TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.local_dining),
                    ),
                    Tab(
                      icon: Icon(Icons.restaurant),
                    ),
                    Tab(
                      icon: Icon(Icons.fastfood),
                    ),
                    Tab(
                      icon: Icon(Icons.local_drink),
                    ),
                  ],
                )
              : null,
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text('Cart'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              title: Text('Checkout'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Account'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.teal[300],
          onTap: _onItemTapped,
          unselectedItemColor: Colors.grey[500],
        ),
      ),
    );
  }
}
