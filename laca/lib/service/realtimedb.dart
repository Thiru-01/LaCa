import 'package:firebase_database/firebase_database.dart';

class RealDb {
  final FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  Future<void> uploadRData(
      {required String id,
      required String name,
      required Map<String, dynamic> data}) async {
    firebaseDatabase.ref(id).child(name).set(data);
  }

  Future<void> updateRData(
      {required String id,
      required String name,
      required Map<String, dynamic> data}) async {
    await firebaseDatabase.ref(id).child(name).update(data);
  }
}
