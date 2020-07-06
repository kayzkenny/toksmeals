import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Thank you for you order'),
            SizedBox(height: 16.0),
            Text('You order is on its way'),
            SizedBox(height: 16.0),
            RaisedButton(
              child: Text('Continue Shopping'),
              textColor: Colors.white,
              // TODO: Add Orders Page
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              color: Colors.teal[300],
            ),
            SizedBox(height: 16.0),
            RaisedButton(
              child: Text('My Orders'),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/orders');
              },
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              color: Colors.teal[300],
            ),
          ],
        ),
      ),
    );
  }
}
