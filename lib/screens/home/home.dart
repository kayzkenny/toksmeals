import 'package:flutter/material.dart';
import 'package:toksmeals/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
            Icon(Icons.local_dining),
            Icon(Icons.fastfood),
            Icon(Icons.local_drink),
          ],
        ),
      ),
    );
  }
}
