import 'package:movies_app/core/services/firebase_firestore_service.dart';
import 'package:movies_app/core/utils/api_end_points.dart';

import 'watch_list_remote_data_source.dart';

class WatchListRemoteDataSourceImpl implements WatchListRemoteDataSource {
  final FirebaseFirestoreService firebaseFirestoreService;
  WatchListRemoteDataSourceImpl({required this.firebaseFirestoreService});
  @override
  Future<void> addMovieToWatchList(
      {required int docsId, required Map<String, dynamic> data}) async {
    await firebaseFirestoreService.addData(

      path: ApiEndPoints.watchListCollection,
      data: data,
      documentId: docsId.toString(),
    );
  }
}
