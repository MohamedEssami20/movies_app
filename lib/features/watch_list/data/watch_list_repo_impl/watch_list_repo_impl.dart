import 'package:movies_app/features/watch_list/data/watch_list_remote_data_source/watch_list_remote_data_source.dart';
import '../../domain/watch_list_repos/watch_list_repos.dart';

class WatchListRepoImpl implements WatchListRepos {
  final WatchListRemoteDataSource watchListRemoteDataSource;
  WatchListRepoImpl({required this.watchListRemoteDataSource});
  @override
  Future<void> addMovieToWatchList(
      {required int docsId, required Map<String, dynamic> data}) async {
    await watchListRemoteDataSource.addMovieToWatchList(
      docsId: docsId,
      data: data,
    );
  }
}
