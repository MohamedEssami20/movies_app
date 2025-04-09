import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';

import '../../../domain/entities/now_playing_entity.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.homeRepos) : super(MoviesInitial());
  final HomeRepos homeRepos;

  // create method that get now playing movies;
  Future<void> getNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());
    final result = await homeRepos.getNowPlayingMovies();
    result.fold(
      (faliure) => emit(NowPlayingMoviesFailure(errorMessage: faliure.message)),
      (nowPlayingMovies) => emit(
        NowPlayingMoviesSuccess(
          nowPlayingEntity: nowPlayingMovies,
        ),
      ),
    );
  }
}
