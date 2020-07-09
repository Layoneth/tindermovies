import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

  //Collection reference
  final CollectionReference movies = Firestore.instance.collection('movies');

  
}
