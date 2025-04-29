
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/cubits/cubit/check_internnet_connection_cubit.dart';
import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';
import '../../../domain/home_repos/home_repos.dart';

part 'trending_movies_state.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit({required this.homeRepos, required this.context})
      : super(TrendingMoviesInitial()){
            scrollController.addListener(getNextPageOfTrendingMovies);
      }

  final HomeRepos homeRepos;
  final BuildContext context;
  List<TrendingMoviesEntity> currentTrendingMovies = [];
  int nextPage = 1;
  bool isPagination = false;
  double oldMaxScroll = 0;
  int oldMoviesLength = 0;
  final ScrollController scrollController = ScrollController();

  Future<void> getTrendingMovies({int pageNumber = 1}) async {
    pageNumber == 1
        ? emit(TrendingMoviesLoading())
        : emit(TrendingMoviesPaginationLoading());
    final result = await homeRepos.getTrendingMovies(pageNumber: pageNumber);
    result.fold((faliure) {
      pageNumber == 1
          ? emit(
              TrendingMoviesFailure(errorMessage: faliure.message),
            )
          : emit(
              TrendingMoviesPaginationFailure(errorMessage: faliure.message),
            );
    }, (trendingMovies) {
      if (pageNumber == 1) {
        final bool iscurrentMovieEqualNewMovies =
            checkIfCurrentMoviesEqualNewMovies(
                currentTrendingMovies, trendingMovies);
        if (iscurrentMovieEqualNewMovies) {
          currentTrendingMovies.clear();
          currentTrendingMovies.addAll(trendingMovies);
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
      } else {
        currentTrendingMovies.addAll(trendingMovies);
        emit(
          TrendingMoviesPaginationSuccess(
              trendingMoviesEntityList: currentTrendingMovies),
        );
      }
    });
  }

// create method that get next page of trending movies
  Future<void> getNextPageOfTrendingMovies() async {
    final currentScroll = scrollController.position.pixels;
    final maxScroll = scrollController.position.maxScrollExtent;
    final isInternetConnected = context.read<InternnetConnectionCubit>().state
        is InternetConnectionSuccess;
    if (currentScroll >= maxScroll * 0.7 &&
        !isPagination &&
        state is! TrendingMoviesPaginationLoading &&
        maxScroll >=
            oldMaxScroll +
                (152.4 * (currentTrendingMovies.length - oldMoviesLength))) {
      isPagination = true;
      oldMoviesLength = currentTrendingMovies.length;
      final newPaginaiation = ++nextPage;
      isInternetConnected
          ? await getTrendingMovies(pageNumber: newPaginaiation)
          : null;
      oldMaxScroll = maxScroll;
      isPagination = false;
    }
  }
  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
