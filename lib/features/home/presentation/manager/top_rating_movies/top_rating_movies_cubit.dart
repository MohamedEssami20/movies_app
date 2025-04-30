import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';
import '../../../../../core/cubits/cubit/check_internnet_connection_cubit.dart';
import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';

part 'top_rating_movies_state.dart';

class TopRatingMoviesCubit extends Cubit<TopRatingMoviesState> {
  TopRatingMoviesCubit(this.homeRepos, this.context)
      : super(TopRatingMoviesInitial()) {
    scrollController.addListener(paginationTopRatingMovies);
  }
  final HomeRepos homeRepos;
  final BuildContext context;
  final List<TopRatingMoviesEntity> currentTopRatingMovies =
      []; //[TopRatingMoviesEntity()];
  final ScrollController scrollController = ScrollController();
  int nextPage = 1;
  int oldtopRatingmoviesLength = 0;
  bool isPagination = false;
  double oldMaxScroll = 0.0;

  // create method that get top rating movies;
  Future<void> getTopRatingMovies({int pageNumber = 1}) async {
    pageNumber == 1
        ? emit(TopRatingMoviesLoading())
        : emit(TopRatingMoviesPaginationLoading());
    final result = await homeRepos.getTopRatingMovies();
    result.fold(
      (failure) {
        pageNumber == 1
            ? emit(TopRatingMoviesFailure(errorMessage: failure.message))
            : emit(
                TopRatingMoviesPaginationFailure(errorMessage: failure.message),
              );
      },
      (topRatingMovies) {
        if (pageNumber == 1) {
          final bool iscurrentMovieEqualNewMovies =
              checkIfCurrentMoviesEqualNewMovies(
                  currentTopRatingMovies, topRatingMovies);
          if (iscurrentMovieEqualNewMovies) {
            currentTopRatingMovies.clear();
            currentTopRatingMovies.addAll(topRatingMovies);
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
        } else {
          currentTopRatingMovies.addAll(topRatingMovies);
          emit(
            TopRatingMoviesPaginationSuccess(
                topRatingMoviesEntityList: currentTopRatingMovies),
          );
        }
      },
    );
  }

  // create method that make pagination of to rating movies;
  Future<void> paginationTopRatingMovies() async {
    final currentScroll = scrollController.position.pixels;
    final maxScroll = scrollController.position.maxScrollExtent;
    final isInternetConnected = context.read<InternetConnectionCubit>().state
        is InternetConnectionSuccess;
    if (!isPagination &&
        state is! TopRatingMoviesLoading &&
        currentScroll >= maxScroll * 0.7 &&
        maxScroll >=
            oldMaxScroll +
                (152.4 *
                    (currentTopRatingMovies.length -
                        oldtopRatingmoviesLength))) {
      isPagination = true;
      oldtopRatingmoviesLength = currentTopRatingMovies.length;
      final newPaginaiation = ++nextPage;
      isInternetConnected
          ? await getTopRatingMovies(pageNumber: newPaginaiation)
          : null;
      isPagination = false;
      oldMaxScroll = maxScroll;
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
