import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  String id;
  String name;
  String email;

  User({
    this.id,
    this.name,
    this.email,
  });

  User.fromSnapshot(FirebaseUser currentUser)
      : id = currentUser.uid,
        name = currentUser.displayName,
        email = currentUser.email;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
    };
  }
}
