import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/up_coming_movies_entity/up_coming_movies_entity.dart';
import '../../../domain/home_repos/home_repos.dart';

part 'up_coming_movies_state.dart';

class UpComingMoviesCubit extends Cubit<UpComingMoviesState> {
  UpComingMoviesCubit(this.homeRepos) : super(UpComingMoviesInitial());
  final HomeRepos homeRepos;

  final List<UpComingMoviesEntity> currentUpComingMovies = []; //.obs;
  //create method that get up coming movies;
  Future<void> getUpComingMovies() async {
    emit(UpComingMoviesLoading());
    final result = await homeRepos.getUpComingMovies();
    result.fold(
        (faliure) => emit(
              UpComingMoviesFailure(message: faliure.message),
            ), (upComingMovies) {
      final bool iscurrentMovieEqualNewMovies =
          checkIfCurrentMoviesEqualNewMovies(
              currentUpComingMovies, upComingMovies);
      if (iscurrentMovieEqualNewMovies) {
        emit(
          UpComingMoviesSuccess(upComingMovies: currentUpComingMovies),
        );
      } else {
        currentUpComingMovies.clear();
        currentUpComingMovies.addAll(upComingMovies);
        emit(
          UpComingMoviesSuccess(upComingMovies: currentUpComingMovies),
        );
      }
    });
  }
}
