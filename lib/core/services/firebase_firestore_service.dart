import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/core/services/database_service.dart';

class FirebaseFirestoreService implements DatabaseService {
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
       String? documentId}) async{
    if(documentId==null){
      await FirebaseFirestore.instance.collection(path).add(data);
    }
    else{
      await FirebaseFirestore.instance.collection(path).doc(documentId).set(data);
    }
  }
}
