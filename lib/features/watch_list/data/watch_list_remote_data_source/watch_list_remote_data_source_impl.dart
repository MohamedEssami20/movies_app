import 'package:movies_app/core/services/firebase_firestore_service.dart';
import 'package:movies_app/core/utils/api_end_points.dart';
import 'package:movies_app/features/watch_list/data/models/watch_list_model.dart';
import 'package:movies_app/features/watch_list/domain/watch_list_entity/watch_list_entity.dart';

import 'watch_list_remote_data_source.dart';

class WatchListRemoteDataSourceImpl implements WatchListRemoteDataSource {
  final FirebaseFirestoreService firebaseFirestoreService;
  WatchListRemoteDataSourceImpl({required this.firebaseFirestoreService});
  @override

  // implement addMovieToWatchList;
  Future<void> addMovieToWatchList(
      {required int docsId, required Map<String, dynamic> data}) async {
    await firebaseFirestoreService.addData(
      path: ApiEndPoints.watchListCollection,
      data: data,
      documentId: docsId.toString(),
    );
  }

  // implement getWatchListMovies;
  @override
  Future<List<WatchListEntity>> getWatchListMovies() async {
    List<WatchListEntity> watchListEntity = [];
    final results = await firebaseFirestoreService.getData(
      path: ApiEndPoints.watchListCollection,
    );

    for (var result in results.entries) {
      watchListEntity.add(
        WatchListModel.formFireStore(
          result.value,
        ),
      );
    }
    return watchListEntity;
  }
}
