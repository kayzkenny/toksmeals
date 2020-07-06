import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toksmeals/models/cart.dart';
import 'package:toksmeals/models/user.dart';
import 'package:toksmeals/screens/account/account_form.dart';
import 'package:toksmeals/screens/checkout/receipt_page.dart';
import 'package:toksmeals/screens/home/home.dart';
import 'package:toksmeals/screens/wrapper.dart';
import 'package:toksmeals/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(value: AuthService().user),
        ChangeNotifierProvider(create: (context) => Cart())
      ],
      child: MaterialApp(
        home: Wrapper(),
        routes: {
          '/accountForm': (context) => AccountForm(),
          '/home': (context) => Home(),
          '/receipt': (context) => ReceiptPage(),
        },
      ),
    );
  }
}
