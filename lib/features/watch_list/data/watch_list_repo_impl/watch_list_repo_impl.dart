import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/errors/firestore_errors.dart';
import 'package:movies_app/features/watch_list/data/watch_list_remote_data_source/watch_list_remote_data_source.dart';
import 'package:movies_app/features/watch_list/domain/watch_list_entity/watch_list_entity.dart';
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

  // implement getWatchListMovies;
  @override
  Future<Either<Failure, List<WatchListEntity>>> getWatchListMovies() async {
    try {
      final results = await watchListRemoteDataSource.getWatchListMovies();
      return right(results);
    } on FirebaseException catch (error) {
      return left(
        FirestoreErrors.fromCode(error),
      );
    } catch (error) {
      return left(
        Failure("Opps there was an error, try later."),
      );
    }
  }
}
