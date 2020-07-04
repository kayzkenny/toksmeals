import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toksmeals/models/user.dart';
import 'package:toksmeals/screens/account/account_form.dart';
import 'package:toksmeals/screens/wrapper.dart';
import 'package:toksmeals/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        routes: {
          '/accountForm': (context) => AccountForm(),
        },
      ),
    );
  }
}
