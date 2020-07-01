import 'package:flutter/material.dart';
import 'package:toksmeals/models/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;
  MenuItemCard({this.menuItem});

  @override
  Widget build(BuildContext context) {
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
                flex: 2,
                child: ListTile(
                  title: Text(menuItem.name),
                  subtitle: Text(
                    '\u{20A6}${menuItem.price}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('ADD'),
                      onPressed: () {/* ... */},
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
