import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/search/domain/search_repos/search_repos.dart';

import '../../../domain/entities/search_movies_entity/search_movies_entity.dart'
    show SearchMoviesEntity;

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepos}) : super(SearchInitial());

  final SearchRepos searchRepos;

  //create method that search movies;

  Future<void> searchMovies({required String query}) async {
    emit(SearchLoading());
    final results = await searchRepos.getSearchMovies(query: query);
    results.fold((faliure) {
      emit(
        SearchFailure(errorMessage: faliure.message),
      );
    },
    (movies){
      emit(
        SearchSuccess(searchMovies: movies),
      );
      }
    );
  }
}
