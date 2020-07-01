import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toksmeals/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  // update user data
  Future updateUserData({
    String address,
    String firstName,
    String lastName,
    String phoneNumber,
    String zipCode,
    String uid,
  }) async {
    return await userCollection.document(uid).setData({
      'address': address,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'zipCode': zipCode
    });
  }

  // user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      address: snapshot.data['address'],
      firstName: snapshot.data['firstName'],
      lastName: snapshot.data['lastName'],
      phoneNumber: snapshot.data['phoneNumber'],
      zipCode: snapshot.data['zipCode'],
    );
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
