import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';
import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/now_playing_entity.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.homeRepos) : super(MoviesInitial());
  final HomeRepos homeRepos;
  List<NowPlayingEntity> currentNowPlayingEntity = [];
  List<PopularMoviesEntity> currentPoupularMovies = [];

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

  // create method that return popular movies;
  Future<void> getPopularMovies() async {
    emit(PopularMoviesLoading());

    final results = await homeRepos.getTrendingMovies();
    results.fold((failure) {
      emit(
        PopularMoviesFailure(errorMessage: failure.message),
      );
    }, (popularMovies) {
      final bool iscurrentMoviesEqualNewMovies =
          checkIfCurrentMoviesEqualNewMovies(
              currentPoupularMovies, popularMovies);
      if (iscurrentMoviesEqualNewMovies) {
        emit(
          PopularMoviesSuccess(popularMovies: currentPoupularMovies),
        );
      } else {
        currentPoupularMovies.clear();
        currentPoupularMovies.addAll(popularMovies);
        emit(
          PopularMoviesSuccess(popularMovies: currentPoupularMovies),
        );
      }
    });
  }
}
