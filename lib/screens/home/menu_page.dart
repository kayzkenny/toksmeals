import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toksmeals/models/menu_item.dart';
import 'package:toksmeals/screens/home/menu.dart';
import 'package:toksmeals/services/database.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        StreamProvider<List<MenuItem>>.value(
          value: DatabaseService().meals,
          child: Menu(),
        ),
        StreamProvider<List<MenuItem>>.value(
          value: DatabaseService().singles,
          child: Menu(),
        ),
        StreamProvider<List<MenuItem>>.value(
          value: DatabaseService().sides,
          child: Menu(),
        ),
        StreamProvider<List<MenuItem>>.value(
          value: DatabaseService().drinks,
          child: Menu(),
        ),
      ],
    );
  }
}
