import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toksmeals/models/user.dart';
import 'package:toksmeals/screens/authenticate/authenticate.dart';
import 'package:toksmeals/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // return either Home or Authenticate widget
    return user == null ? Authentcate() : Home();
  }
}
