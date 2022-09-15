import 'package:firebase_database/firebase_database.dart';

class RealDb {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  Future<void> uploadRData(
      {required String id,
      required String name,
      required Map<String, dynamic> data}) async {
    _firebaseDatabase.ref(id).child(name).set(data);
  }
}
