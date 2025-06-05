import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/search/domain/search_repos/search_repos.dart';

import '../../../domain/entities/search_movies_entity/search_movies_entity.dart'
    show SearchMoviesEntity;

part 'search_state.dart';

class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  SearchMoviesCubit({required this.searchRepos}) : super(SearchMoviesInitial());

  final SearchRepos searchRepos;

  //create method that search movies;

  Future<void> searchMovies({required String query}) async {
    emit(SearchMoviesLoading());
    final results = await searchRepos.getSearchMovies(query: query);
    results.fold((faliure) {
      emit(
        SearchMoviesFailure(errorMessage: faliure.message),
      );
    }, (movies) {
      emit(
        SearchMoviesSuccess(searchMovies: movies),
      );
    });
  }
}
