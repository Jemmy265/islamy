import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:islamy/Database/Model/Task.dart';
import 'package:islamy/Database/Model/user.dart';

class MyDatabase {
  static CollectionReference<User> getUserCollections() {
    return FirebaseFirestore.instance
        .collection(User.collectionName)
        .withConverter<User>(fromFirestore: (snapshot, options) {
      return User.FromFireStore(snapshot.data());
    }, toFirestore: (user, options) {
      return user.toFireStore();
    });
  }

  static CollectionReference<zakah> getzakahCollections(String uid) {
    return getUserCollections()
        .doc(uid)
        .collection(zakah.collectionName)
        .withConverter<zakah>(fromFirestore: (snapshot, options) {
      return zakah.FromFireStore(snapshot.data());
    }, toFirestore: (zakah, options) {
      return zakah.toFireStore();
    });
  }

  static Future<void> addUser(User user) {
    var collection = getUserCollections();
    return collection.doc(user.id).set(user);
  }

  static Future<User?> readUser(String id) async {
    var collection = getUserCollections();
    var docSnapShot = await collection.doc(id).get();
    return docSnapShot.data();
  }

  static Future<void> addzakah(String uid, zakah zakah) {
    var newzakahDoc = getzakahCollections(uid).doc();
    zakah.id = newzakahDoc.id;
    return newzakahDoc.set(zakah);
  }

  static Future<QuerySnapshot<zakah>> getzakah(String uId) {
    return getzakahCollections(uId).get();
  }

  static Future<void> deletezakah(String uid, String zakahId) async {
    await getzakahCollections(uid).doc(zakahId).delete();
  }

  static Future<void> updatezakah(String uid, zakah zakah) async {
    await getzakahCollections(uid).doc(zakah.id).update(
          zakah.toFireStore(),
        );
  }
}
