import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toksmeals/models/menu_item.dart';
import 'package:toksmeals/screens/home/meal_menu.dart';
import 'package:toksmeals/services/auth.dart';
import 'package:toksmeals/services/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<MenuItem>>.value(
      value: DatabaseService().meals,
      child: DefaultTabController(
        length: 3,
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
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.local_dining),
                ),
                Tab(
                  icon: Icon(Icons.fastfood),
                ),
                Tab(
                  icon: Icon(Icons.local_drink),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MealsMenu(),
              Icon(Icons.fastfood),
              Icon(Icons.local_drink),
            ],
          ),
        ),
      ),
    );
  }
}
