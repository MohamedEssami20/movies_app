import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/search/domain/search_repos/search_repos.dart';
import '../../../../../core/cubits/cubit/check_internnet_connection_cubit.dart'
    show InternetConnectionCubit, InternetConnectionSuccess;
import '../../../domain/entities/search_movies_entity/search_movies_entity.dart'
    show SearchMoviesEntity;

part 'search_state.dart';

class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  SearchMoviesCubit({required this.searchRepos, required this.context})
      : super(SearchMoviesInitial()) {
    scrollController.addListener(() {
      getNextPageOfSearchMovies(query: query);
    });
  }

  final SearchRepos searchRepos;
  List<SearchMoviesEntity> currentSearchMovies = [];
  final BuildContext context;
  ScrollController scrollController = ScrollController();
  int nextPage = 1;
  bool isPagination = false;
  double oldMaxScroll = 0;
  int oldMoviesLength = 0;
  late String query;
  //create method that search movies;

  Future<void> searchMovies({required String query, int pageNumber = 1}) async {
    this.query = query;
    pageNumber == 1
        ? emit(SearchMoviesLoading())
        : emit(SearchMoviesPaginationLoading());
    final results =
        await searchRepos.getSearchMovies(query: query, pageNumber: pageNumber);
    results.fold((faliure) {
      if (pageNumber == 1) {
        emit(SearchMoviesFailure(errorMessage: faliure.message));
      } else {
        emit(SearchMoviesPaginationFailure(errorMessage: faliure.message));
      }
    }, (movies) {
      if (pageNumber == 1) {
        currentSearchMovies.clear();
        currentSearchMovies.addAll(movies);
        emit(SearchMoviesSuccess(searchMovies: currentSearchMovies));
      } else {
        if (movies.isNotEmpty) {
          currentSearchMovies.addAll(movies);
          emit(
              SearchMoviesPaginationSuccess(searchMovies: currentSearchMovies));
        } else {
          null;
        }
      }
    });
  }

  // create method that paginate movies;
  Future<void> getNextPageOfSearchMovies({required String query}) async {
    double currentScroll = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    final isInternetConnected = context.read<InternetConnectionCubit>().state
        is InternetConnectionSuccess;
    if (currentScroll >= maxScroll * 0.7 &&
        !isPagination &&
        state is! SearchMoviesPaginationLoading &&
        maxScroll >=
            oldMaxScroll +
                (73.1 * (currentSearchMovies.length - oldMoviesLength))) {
      isPagination = true;
      oldMoviesLength = currentSearchMovies.length;
      final newPaginaiation = ++nextPage;
      isInternetConnected
          ? await searchMovies(pageNumber: newPaginaiation, query: query)
          : null;
      oldMaxScroll = maxScroll;
      isPagination = false;
    }
  }

  // dispose the cubit;
  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
