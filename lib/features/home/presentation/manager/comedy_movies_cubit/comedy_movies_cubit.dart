import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/func/no_internet_at_end_of_list.dart';

import '../../../../../core/cubits/cubit/check_internnet_connection_cubit.dart';
import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/comedy_movies_entity/comedy_movies_entity.dart';
import '../../../domain/home_repos/home_repos.dart';
part 'comedy_movies_state.dart';

class ComedyMoviesCubit extends Cubit<ComedyMoviesState> {
  ComedyMoviesCubit({required this.homeRepos, required this.context})
      : super(ComedyMoviesInitial()) {
    scrollController.addListener(() {
      getComedyMoviesPagination();
      noInternetConnectionAtendOfList(
          context: context, scrollController: scrollController);
    });
  }

  final HomeRepos homeRepos;
  final BuildContext context;

  ScrollController scrollController = ScrollController();
  List<ComedyMoviesEntity> currentComedyMovies = [];
  int nextPage = 1;
  bool isPagination = false;
  double oldMaxScroll = 0;
  int oldMoviesLength = 0;

  // create method that get comedy movies;
  Future<void> getComedyMovies({int pageNumber = 1}) async {
    pageNumber == 1
        ? emit(
            ComedyMoviesLoading(),
          )
        : emit(
            ComedyMoviesPaginationLoading(),
          );

    final results = await homeRepos.getComedyMovies(pageNumber: pageNumber);
    results.fold((failure) {
      if (pageNumber == 1) {
        emit(ComedyMoviesFailure(
          errorMessage: failure.message,
        ));
      } else {
        emit(ComedyMoviesPaginationFailure(
          errorMessage: failure.message,
        ));
      }
    }, (comedyMovies) {
      if (pageNumber == 1) {
        final bool iscurrentMoviesEqualNewMovies =
            checkIfCurrentMoviesEqualNewMovies(
                currentComedyMovies, comedyMovies);
        if (iscurrentMoviesEqualNewMovies) {
          currentComedyMovies.clear();
          currentComedyMovies.addAll(comedyMovies);
          emit(ComedyMoviesSuccess(
            comedyMovies: currentComedyMovies,
          ));
        } else {
          currentComedyMovies.clear();
          currentComedyMovies.addAll(comedyMovies);
          emit(ComedyMoviesSuccess(
            comedyMovies: currentComedyMovies,
          ));
        }
      } else {
        currentComedyMovies.addAll(comedyMovies);
        emit(ComedyMoviesPaginationSuccess(
          comedyMovies: currentComedyMovies,
        ));
      }
    });
  }

  // create method that get comedy movies pagination;
  Future<void> getComedyMoviesPagination() async {
    double currentScroll = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    final isInternetConnected = context.read<InternetConnectionCubit>().state
        is InternetConnectionSuccess;
    if (currentScroll >= maxScroll * 0.7 &&
        !isPagination &&
        state is! ComedyMoviesPaginationLoading &&
        maxScroll >=
            oldMaxScroll +
                (73.1 * (currentComedyMovies.length - oldMoviesLength))) {
      isPagination = true;
      oldMoviesLength = currentComedyMovies.length;
      final newPaginaiation = ++nextPage;
      isInternetConnected
          ? await getComedyMovies(pageNumber: newPaginaiation)
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
