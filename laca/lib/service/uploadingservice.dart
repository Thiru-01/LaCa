import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:laca/components/cards.dart';
import 'package:laca/model/currentprocessmodel.dart';
import 'package:laca/model/processmodel.dart';
import 'package:laca/service/firestoreservice.dart';
import 'package:laca/service/realtimedb.dart';
import 'package:laca/service/servicekey.dart';

class UploadingService with FirestoreService, RealDb {
  Future<void> uploadFire(context,
      {required String name,
      required String timestamp,
      required Map<dynamic, dynamic> data}) async {
    Map<String, dynamic> mappedValue = getContentCode(data["contents"]);
    await uploadRData(id: PROCESS, name: timestamp, data: mappedValue);
    CurrentProcessModel currentProcessModel = CurrentProcessModel(
        id: timestamp, totalLine: data["length"], completedLine: 0);
    await uploadData(
        id: PROCESS, name: timestamp, data: currentProcessModel.toJson());
    ProcessModel model = ProcessModel(
        id: timestamp,
        name: name,
        totalLine: data['length'],
        timestamp: timestamp,
        status: 'pending');
    await uploadData(
        id: FFLAG,
        name: "toprocess",
        data: {"command": "pause", "id": timestamp});
    await uploadData(id: FGENERAL, name: timestamp, data: model.toJson());
  }

  Map<String, dynamic> getContentCode(List<dynamic> value) {
    Map<String, dynamic> result = {};
    for (int i = 0; i < value.length; i++) {
      result.addAll({i.toString(): value[i]});
    }
    return result;
  }

  Future<bool> checkAvailable() async {
    DocumentSnapshot flags =
        await firebaseFirestore.collection("flags").doc("toprocess").get();
    return !flags.exists;
  }
}
