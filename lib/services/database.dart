import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toksmeals/models/menu_item.dart';
import 'package:toksmeals/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  final CollectionReference menuCollection =
      Firestore.instance.collection('menu');

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

  // menu item list from snapshot
  List<MenuItem> _menuItemListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents
        .map(
          (doc) => MenuItem(
            category: doc.data['category'] ?? '',
            imageUrl: doc.data['imageUrl'] ?? '',
            name: doc.data['name'] ?? '',
            price: doc.data['price'] ?? '',
          ),
        )
        .toList();
  }

  // get meals stream
  Stream<List<MenuItem>> get meals {
    return menuCollection
        .where("category", isEqualTo: "meal")
        .snapshots()
        .map(_menuItemListFromSnapshot);
  }

  // get meals stream
  Stream<List<MenuItem>> get singles {
    return menuCollection
        .where("category", isEqualTo: "single")
        .snapshots()
        .map(_menuItemListFromSnapshot);
  }

  // get meals stream
  Stream<List<MenuItem>> get sides {
    return menuCollection
        .where("category", isEqualTo: "side")
        .snapshots()
        .map(_menuItemListFromSnapshot);
  }

  // get meals stream
  Stream<List<MenuItem>> get drinks {
    return menuCollection
        .where("category", isEqualTo: "drink")
        .snapshots()
        .map(_menuItemListFromSnapshot);
  }
}
