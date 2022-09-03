

import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DbHelper {
  static const String _collectionUser = 'Users';
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Insert User
  static Future<void> addUser(UserModel userModel) {
    final doc = _db.collection(_collectionUser).doc(userModel.uid);
    return doc.set(userModel.toMap());
  }

  //get User Data
  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserById(String uid) =>
       _db.collection(_collectionUser).doc(uid).snapshots();


  //Update Profile
  static Future<void> updateProfile(String uid, Map<String, dynamic> map) {
    return _db.collection(_collectionUser).doc(uid).update(map);
  }




}