import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toksmeals/models/user.dart';
import 'package:toksmeals/services/database.dart';
import 'package:toksmeals/shared/constants.dart';
import 'package:toksmeals/shared/loading.dart';

class AccountForm extends StatefulWidget {
  @override
  _AccountFormState createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final _formKey = GlobalKey<FormState>();

  // form values
  String _currentFirstName;
  String _currentLastName;
  String _currentPhoneNumber;
  String _currentAddress;
  String _currentZipCode;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text('Account'),
            ),
            body: Container(
              padding: EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Update your profile.',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        initialValue: userData.firstName,
                        decoration: textInputDecoration.copyWith(
                            hintText: 'First Name'),
                        validator: (value) =>
                            value.isEmpty ? 'First Name' : null,
                        onChanged: (value) =>
                            setState(() => _currentFirstName = value),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        initialValue: userData.lastName,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Last Name'),
                        validator: (value) =>
                            value.isEmpty ? 'Last Name' : null,
                        onChanged: (value) =>
                            setState(() => _currentLastName = value),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        initialValue: userData.phoneNumber ?? 'Phone Number',
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Phone Number'),
                        validator: (value) =>
                            value.isEmpty ? 'Phone Number' : null,
                        onChanged: (value) =>
                            setState(() => _currentPhoneNumber = value),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        initialValue: userData.address,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Address'),
                        maxLines: 3,
                        validator: (value) => value.isEmpty ? 'Address' : null,
                        onChanged: (value) =>
                            setState(() => _currentAddress = value),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        initialValue: userData.zipCode,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Zip Code'),
                        validator: (value) => value.isEmpty ? 'Zip Code' : null,
                        onChanged: (value) =>
                            setState(() => _currentZipCode = value),
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        child: Text('UPDATE'),
                        textColor: Colors.white,
                        // padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        color: Colors.teal[300],
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseService(uid: user.uid).updateUserData(
                              firstName:
                                  _currentFirstName ?? userData.firstName,
                              lastName: _currentLastName ?? userData.lastName,
                              phoneNumber:
                                  _currentPhoneNumber ?? userData.phoneNumber,
                              address: _currentAddress ?? userData.phoneNumber,
                              zipCode: _currentZipCode ?? userData.zipCode,
                            );
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
