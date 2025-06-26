import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/errors/firestore_errors.dart';
import 'package:movies_app/features/watch_list/domain/watch_list_repos/watch_list_repos.dart';
part 'watch_list_movies_state.dart';

class WatchListMoviesCubit extends Cubit<WatchListMoviesState> {
  WatchListMoviesCubit({required this.watchListRepos})
      : super(WatchListMoviesInitial());

  final WatchListRepos watchListRepos;
  Future<void> addMovieToWatchList({
    required int docsId,
    required Map<String, dynamic> data,
  }) async {
    emit(AddWatchListMoviesLoading());
    try {
      await watchListRepos.addMovieToWatchList(
        docsId: docsId,
        data: data,
      );
      emit(AddWatchListMoviesSuccess());
    } on FirebaseException catch (error) {
      emit(
        AddWatchListMoviesFailure(
          errorMessage: FirestoreErrors.fromCode(error).message,
        ),
      );
    } catch (error) {
      emit(
        AddWatchListMoviesFailure(
          errorMessage: "Something went wrong",
        ),
      );
    }
  }
}
