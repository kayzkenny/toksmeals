import 'package:flutter/material.dart';
import 'package:toksmeals/screens/authenticate/register.dart';
import 'package:toksmeals/screens/authenticate/sign_in.dart';

class Authentcate extends StatefulWidget {
  @override
  _AuthentcateState createState() => _AuthentcateState();
}

class _AuthentcateState extends State<Authentcate> {
  bool showSignIn = true;
  void toggleView() => setState(() => showSignIn = !showSignIn);

  @override
  Widget build(BuildContext context) {
    return showSignIn
        ? SignIn(toggleView: toggleView)
        : Register(toggleView: toggleView);
  }
}
