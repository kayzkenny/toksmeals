import 'package:flutter/material.dart';
import 'package:toksmeals/models/user.dart';
import 'package:toksmeals/shared/constants.dart';

class UserDataCard extends StatelessWidget {
  const UserDataCard({
    Key key,
    @required this.userData,
  }) : super(key: key);

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
            width: 1.0, color: Colors.grey[400], style: BorderStyle.solid),
      ),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(16.0),
      child: Card(
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'ACCOUNT DETAILS',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  flex: 9,
                ),
                Expanded(
                  child: Icon(
                    Icons.edit,
                    color: Colors.teal[300],
                  ),
                  flex: 1,
                )
              ],
            ),
            LayoutDivider(),
            SizedBox(height: 8.0),
            Text(userData.email),
            SizedBox(height: 8.0),
            userData.firstName == null
                ? Text('No First Name')
                : Text('${userData.firstName} ${userData.lastName}'),
            SizedBox(height: 4.0),
            userData.phoneNumber == null
                ? Text('No Phone Number')
                : Text(userData.phoneNumber),
            SizedBox(height: 4.0),
            userData.address == null ? Text('Address') : Text(userData.address),
            SizedBox(height: 4.0),
            userData.zipCode == null
                ? Text('No ZipCode')
                : Text(userData.zipCode),
          ],
        ),
      ),
    );
  }
}
