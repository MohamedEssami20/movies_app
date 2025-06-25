import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/core/services/database_service.dart';

class FirebaseFirestoreService implements DatabaseService {
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId == null) {
      await FirebaseFirestore.instance.collection(path).add(data);
    } else {
      await FirebaseFirestore.instance
          .collection(path)
          .doc(documentId)
          .set(data);
    }
  }

  @override
  Future <Map<String, dynamic>> getData(
      {required String path}) async {
    final results = await FirebaseFirestore.instance.collection(path).get();
    if (results.docs.isNotEmpty) {
      return results.docs as Map<String,dynamic>;
    }
    else{
      return {};
    }
  }
}
