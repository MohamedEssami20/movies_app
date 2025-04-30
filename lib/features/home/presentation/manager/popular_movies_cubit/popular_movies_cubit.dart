import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/cubit/check_internnet_connection_cubit.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';

import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/popular_movies_entity/popular_movies_entity.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.context, {required this.homeRepos})
      : super(PopularMoviesInitial()) {
    scrollController.addListener(popularMoviesPagination);
  }
  final HomeRepos homeRepos;
  final BuildContext context;
  List<PopularMoviesEntity> currentPoupularMovies = [];
  bool isPagination = false;
  int nextPage = 1;
  double oldMaxScroll = 0.0;
  int oldMoviesLength = 0;
  late ScrollController scrollController = ScrollController();

  // create method that return popular movies;
  Future<void> getPopularMovies({int pageNumber = 1}) async {
    pageNumber == 1
        ? emit(
            PopularMoviesLoading(),
          )
        : emit(
            PopularMoviesPaginationLoading(),
          );

    final results = await homeRepos.getPopularMovies(pageNumber: pageNumber);
    results.fold((failure) {
      if (pageNumber == 1) {
        emit(
          PopularMoviesFailure(
            errorMessage: failure.message,
          ),
        );
      } else {
        emit(
          PopularMoviesPaginationFailure(
            errorMessage: failure.message,
          ),
        );
      }
    }, (popularMovies) {
      if (pageNumber == 1) {
        final bool iscurrentMoviesEqualNewMovies =
            checkIfCurrentMoviesEqualNewMovies(
                currentPoupularMovies, popularMovies);
        if (iscurrentMoviesEqualNewMovies) {
          currentPoupularMovies.clear();
          currentPoupularMovies.addAll(popularMovies);
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
      } else {
        currentPoupularMovies.addAll(popularMovies);
        log("length of popular movies in cubit= ${currentPoupularMovies.length}");
        emit(
          PopularMoviesPaginationSuccess(popularMovies: currentPoupularMovies),
        );
      }
    });
  }

// create method that create pagination of mvoies;
  void popularMoviesPagination() async {
    final currentScroll = scrollController.position.pixels;
    final maxScroll = scrollController.position.maxScrollExtent;
    final isInternetConnceted =
        BlocProvider.of<InternetConnectionCubit>(context).state
            is InternetConnectionSuccess;
    if (currentScroll >= maxScroll * 0.7 &&
        !isPagination &&
        state is! PopularMoviesPaginationLoading &&
        maxScroll >=
            oldMaxScroll +
                (152.4 * (currentPoupularMovies.length - oldMoviesLength))) {
      isPagination = true;
      oldMoviesLength = currentPoupularMovies.length;
      final newPaginaiation = ++nextPage;
      isInternetConnceted
          ? await getPopularMovies(pageNumber: newPaginaiation)
          : null;
      oldMaxScroll = maxScroll;
      isPagination = false;
    }
  }

  // close controller;
  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
