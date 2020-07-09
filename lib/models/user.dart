import 'package:firebase_auth/firebase_auth.dart';

class User {
  String _uid;
  String _name;
  String _email;
  String _phone;
  String _photoUrl;

  get uid => _uid;
  get name => _name;
  get email => _email;
  get phone => _phone;
  get photoUrl => _photoUrl;

  User({String uid, String name, String email, String phone, String photoUrl}) {
    this._uid = uid;
    this._name = name;
    this._email = email;
    this._phone = phone;
    this._photoUrl = photoUrl;
  }

  User.fromFirebaseUser(FirebaseUser user) {
    _uid = user.uid;
    _name = user.displayName;
    _email = user.email;
    _phone = user.phoneNumber;
    _photoUrl = user.photoUrl;
  }
}
