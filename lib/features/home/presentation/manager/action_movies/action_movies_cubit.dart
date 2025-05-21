import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/func/no_internet_at_end_of_list.dart';
import 'package:movies_app/features/home/domain/entities/action_movies_entity/action_movies_entity.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';
import '../../../../../core/cubits/cubit/check_internnet_connection_cubit.dart';
import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
part 'action_movies_state.dart';

class ActionMoviesCubit extends Cubit<ActionMoviesState> {
  ActionMoviesCubit({required this.homeRepos, required this.context})
      : super(ActionMoviesInitial()) {
    scrollController.addListener(() {
      getNextPageOfActionMovies();
      noInternetConnectionAtendOfList(
        context: context,
        scrollController: scrollController,
      );
    });
  }
  final HomeRepos homeRepos;
  final BuildContext context;

  ScrollController scrollController = ScrollController();
  List<ActionMoviesEntity> currentActionMovies = [];
  int nextPage = 1;
  bool isPagination = false;
  double oldMaxScroll = 0;
  int oldMoviesLength = 0;

// create method that get action movies;
  Future<void> getActionMovies({int pageNumber = 1}) async {
    pageNumber == 1
        ? emit(
            ActionMoviesLoading(),
          )
        : emit(
            ActionMoviesPaginationLoading(),
          );

    final results = await homeRepos.getActionMovies(pageNumber: pageNumber);
    results.fold((failure) {
      if (pageNumber == 1) {
        emit(ActionMoviesFailure(
          errorMessage: failure.message,
        ));
      } else {
        emit(ActionMoviesPaginationFailure(
          errorMessage: failure.message,
        ));
      }
    }, (actionMovies) {
      if (pageNumber == 1) {
        final bool iscurrentMoviesEqualNewMovies =
            checkIfCurrentMoviesEqualNewMovies(
                currentActionMovies, actionMovies);
        if (iscurrentMoviesEqualNewMovies) {
          currentActionMovies.clear();
          currentActionMovies.addAll(actionMovies);
          emit(ActionMoviesSuccess(
            actionMovies: currentActionMovies,
          ));
        } else {
          currentActionMovies.clear();
          currentActionMovies.addAll(actionMovies);
          emit(ActionMoviesSuccess(
            actionMovies: currentActionMovies,
          ));
        }
      } else {
        currentActionMovies.addAll(actionMovies);
        emit(ActionMoviesPaginationSuccess(
          actionMovies: currentActionMovies,
        ));
      }
    });
  }

  // create method that get next page of action movies;
  Future<void> getNextPageOfActionMovies() async {
    double currentScroll = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    final isInternetConnected = context.read<InternetConnectionCubit>().state
        is InternetConnectionSuccess;
    log("max action movies scroll= $maxScroll");
    if (currentScroll >= maxScroll * 0.7 &&
        !isPagination &&
        state is! ActionMoviesPaginationLoading &&
        maxScroll >=
            oldMaxScroll +
                (73.1 * (currentActionMovies.length - oldMoviesLength))) {
      isPagination = true;
      oldMoviesLength = currentActionMovies.length;
      final newPaginaiation = ++nextPage;
      log("************** iam in pagination in action movies **********");
      isInternetConnected
          ? await getActionMovies(pageNumber: newPaginaiation)
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
