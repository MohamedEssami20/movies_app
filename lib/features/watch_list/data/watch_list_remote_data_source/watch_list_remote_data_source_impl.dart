import 'package:firebase_core/firebase_core.dart';
import 'package:movies_app/core/errors/firestore_errors.dart';
import 'package:movies_app/core/services/firebase_firestore_service.dart';

import 'watch_list_remote_data_source.dart';

class WatchListRemoteDataSourceImpl implements WatchListRemoteDataSource {
  final FirebaseFirestoreService firebaseFirestoreService;
  WatchListRemoteDataSourceImpl({required this.firebaseFirestoreService});
  @override
  Future<void> addMovieToWatchList(
      {required String path,
      required int docsId,
      required Map<String, dynamic> data}) async {
    try {
      await firebaseFirestoreService.addData(
        path: path,
        data: data,
        documentId: docsId.toString(),
      );
    } on FirebaseException catch (error) {
      FirestoreErrors.fromCode(error);
    } catch (error) {
      throw "Unknown error, try later";
    }
  }
}
