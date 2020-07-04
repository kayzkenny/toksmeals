// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:toksmeals/models/user.dart';
// import 'package:toksmeals/services/database.dart';
// import 'package:toksmeals/shared/constants.dart';
// import 'package:toksmeals/shared/loading.dart';

// class UserDataForm extends StatefulWidget {
//   @override
//   _UserDataFormState createState() => _UserDataFormState();
// }

// class _UserDataFormState extends State<UserDataForm> {
//   final _formKey = GlobalKey<FormState>();

//   // form values
//   String _currentFirstName;
//   String _currentLastName;
//   String _currentPhoneNumber;
//   String _currentAddress;
//   String _currentZipCode;

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<User>(context);

//     return StreamBuilder<UserData>(
//       stream: DatabaseService(uid: user.uid).userData,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           UserData userData = snapshot.data;
//           return Form(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     'Update your profile.',
//                     style: TextStyle(fontSize: 18.0),
//                   ),
//                   SizedBox(height: 20.0),
//                   TextFormField(
//                     initialValue: userData.firstName,
//                     decoration: textInputDecoration,
//                     validator: (value) => value.isEmpty ? 'First Name' : null,
//                     onChanged: (value) =>
//                         setState(() => _currentFirstName = value),
//                   ),
//                   SizedBox(height: 20.0),
//                   TextFormField(
//                     initialValue: userData.lastName,
//                     decoration: textInputDecoration,
//                     validator: (value) => value.isEmpty ? 'Last Name' : null,
//                     onChanged: (value) =>
//                         setState(() => _currentLastName = value),
//                   ),
//                   SizedBox(height: 20.0),
//                   TextFormField(
//                     initialValue: userData.phoneNumber,
//                     decoration: textInputDecoration,
//                     validator: (value) => value.isEmpty ? 'Phone Number' : null,
//                     onChanged: (value) =>
//                         setState(() => _currentPhoneNumber = value),
//                   ),
//                   SizedBox(height: 20.0),
//                   TextFormField(
//                     initialValue: userData.address,
//                     decoration: textInputDecoration,
//                     maxLines: 3,
//                     validator: (value) => value.isEmpty ? 'Address' : null,
//                     onChanged: (value) =>
//                         setState(() => _currentAddress = value),
//                   ),
//                   SizedBox(height: 20.0),
//                   TextFormField(
//                     initialValue: userData.zipCode,
//                     decoration: textInputDecoration,
//                     validator: (value) => value.isEmpty ? 'Address' : null,
//                     onChanged: (value) =>
//                         setState(() => _currentZipCode = value),
//                   ),
//                   SizedBox(height: 20.0),
//                   RaisedButton(
//                     child: Text('UPDATE'),
//                     textColor: Colors.white,
//                     // padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
//                     color: Colors.teal[300],
//                     onPressed: () async {
//                       if (_formKey.currentState.validate()) {
//                         await DatabaseService(uid: user.uid).updateUserData(
//                           firstName: _currentFirstName ?? userData.firstName,
//                           lastName: _currentLastName ?? userData.lastName,
//                           phoneNumber:
//                               _currentPhoneNumber ?? userData.phoneNumber,
//                           address: _currentAddress ?? userData.phoneNumber,
//                         );
//                         Navigator.pop(context);
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         } else {
//           return Loading();
//         }
//       },
//     );
//   }
// }
