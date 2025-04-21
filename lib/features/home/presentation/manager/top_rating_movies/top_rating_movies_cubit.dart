import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';

import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';

part 'top_rating_movies_state.dart';

class TopRatingMoviesCubit extends Cubit<TopRatingMoviesState> {
  TopRatingMoviesCubit(this.homeRepos) : super(TopRatingMoviesInitial());
  final HomeRepos homeRepos;
  final List<TopRatingMoviesEntity> currentTopRatingMovies =
      []; //[TopRatingMoviesEntity()];

  // create method that get top rating movies;
  Future<void> getTopRatingMovies() async {
    emit(TopRatingMoviesLoading());
    final result = await homeRepos.getTopRatingMovies();
    result.fold(
      (failure) {
        emit(
          TopRatingMoviesFailure(errorMessage: failure.message),
        );
      },
      (topRatingMovies) {
        final bool iscurrentMovieEqualNewMovies =
            checkIfCurrentMoviesEqualNewMovies(
                currentTopRatingMovies, topRatingMovies);
        if (iscurrentMovieEqualNewMovies) {
          emit(
            TopRatingMoviesSuccess(
                topRatingMoviesEntityList: currentTopRatingMovies),
          );
        } else {
          currentTopRatingMovies.clear();
          currentTopRatingMovies.addAll(topRatingMovies);
          emit(
            TopRatingMoviesSuccess(
                topRatingMoviesEntityList: currentTopRatingMovies),
          );
        }
      },
    );
  }
}
