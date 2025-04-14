import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';

import '../../../domain/entities/now_playing_entity.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.homeRepos) : super(MoviesInitial());
  final HomeRepos homeRepos;
  List<NowPlayingEntity> currentNowPlayingEntity = [];
  // create method that get now playing movies;
  Future<void> getNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());
    final result = await homeRepos.getNowPlayingMovies();
    result.fold(
        (faliure) =>
            emit(NowPlayingMoviesFailure(errorMessage: faliure.message)),
        (nowPlayingMovies) {
      final bool iscurrentMoviesEqualNewMovies =
          checkIfCurrentMoviesEqualNewMovies(
              currentNowPlayingEntity, nowPlayingMovies);
      if (iscurrentMoviesEqualNewMovies) {
        // trigger current movies if equal new movies;
        emit(
          NowPlayingMoviesSuccess(nowPlayingEntity: currentNowPlayingEntity),
        );
      } else {
        currentNowPlayingEntity.clear();
        currentNowPlayingEntity.addAll(nowPlayingMovies);
        emit(
          NowPlayingMoviesSuccess(nowPlayingEntity: currentNowPlayingEntity),
        );
      }
    });
  }

  // create method that check if current movies equal new movies;
  bool checkIfCurrentMoviesEqualNewMovies(
      List<NowPlayingEntity> currentMovies, List<NowPlayingEntity> newMovies) {
    if (currentMovies.isEmpty || newMovies.isEmpty) {
      // firsr start app;
      return false;
    }
    for (int counter = 0;
        counter < currentMovies.length && counter < newMovies.length;
        counter++) {
      if (currentMovies[counter].moviesId != newMovies[counter].moviesId) {
        return false;
      } // check if current movies equal new movies;
    }
    return true;
  }
}
