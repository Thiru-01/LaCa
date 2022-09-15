import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> uploadData(
      {required String id,
      required String name,
      required Map<String, dynamic> data}) async {
    await firebaseFirestore.collection(id).doc(name).set(data);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getContent({required String id}) {
    return firebaseFirestore.collection(id).snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getStream({
    required String id,
    required String name,
  }) {
    return firebaseFirestore.collection(id).doc(name).snapshots();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getData(
      {required String id, required String name}) async {
    return await firebaseFirestore.collection(id).doc(name).get();
  }
}
