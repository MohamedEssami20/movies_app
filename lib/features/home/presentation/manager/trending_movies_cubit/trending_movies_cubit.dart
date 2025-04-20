import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';
import '../../../domain/home_repos/home_repos.dart';

part 'trending_movies_state.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit({required this.homeRepos})
      : super(TrendingMoviesInitial());

  final HomeRepos homeRepos;
  List<TrendingMoviesEntity> currentTrendingMovies = [];

  Future<void> getTrendingMovies() async {
    emit(TrendingMoviesLoading());
    final result = await homeRepos.getTrendingMovies();
    result.fold((faliure) {
      emit(
        TrendingMoviesFailure(errorMessage: faliure.message),
      );
    }, (trendingMovies) {
      final bool iscurrentMovieEqualNewMovies =
          checkIfCurrentMoviesEqualNewMovies(
              currentTrendingMovies, trendingMovies);
      if (iscurrentMovieEqualNewMovies) {
        emit(
          TrendingMoviesSuccess(
              trendingMoviesEntityList: currentTrendingMovies),
        );
      } else {
        currentTrendingMovies.clear();
        currentTrendingMovies.addAll(trendingMovies);
        emit(
          TrendingMoviesSuccess(
              trendingMoviesEntityList: currentTrendingMovies),
        );
      }
    });
  }
}
