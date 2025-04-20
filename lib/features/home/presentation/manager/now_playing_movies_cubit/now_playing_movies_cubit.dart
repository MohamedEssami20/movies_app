import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';
import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/now_palying_entity/now_playing_entity.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit(this.homeRepos) : super(MoviesInitial());
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
}
