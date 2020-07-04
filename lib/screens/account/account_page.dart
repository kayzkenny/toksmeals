import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toksmeals/models/user.dart';
import 'package:toksmeals/screens/account/user_data_card.dart';
import 'package:toksmeals/services/database.dart';
import 'package:toksmeals/shared/loading.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Account Overview',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: SingleChildScrollView(
                          child: UserDataCard(userData: userData)),
                      onTap: () => Navigator.pushNamed(context, '/accountForm'),
                    ),
                    RaisedButton(
                      child: Text('My Orders'),
                      textColor: Colors.white,
                      // TODO: Add Orders Page
                      onPressed: () {},
                      padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                      color: Colors.teal[300],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
