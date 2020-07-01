import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toksmeals/models/menu_item.dart';
import 'package:toksmeals/screens/home/menu_item_card.dart';
import 'package:toksmeals/services/database.dart';

class MealsMenu extends StatefulWidget {
  @override
  _MealsMenuState createState() => _MealsMenuState();
}

class _MealsMenuState extends State<MealsMenu> {
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
