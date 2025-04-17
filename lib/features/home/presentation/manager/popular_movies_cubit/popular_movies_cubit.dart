import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';

import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/popular_movies_entity.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit({required this.homeRepos}) : super(PopularMoviesInitial());
  final HomeRepos homeRepos ;
  List<PopularMoviesEntity> currentPoupularMovies = [];
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
