import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toksmeals/models/menu_item.dart';
import 'package:toksmeals/screens/home/menu_item_card.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<List<MenuItem>>(context) ?? [];

    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MenuItemCard(menuItem: meals[index]);
      },
    );
  }
}
