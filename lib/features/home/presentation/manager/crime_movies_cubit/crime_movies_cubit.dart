import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/func/no_internet_at_end_of_list.dart';
import '../../../../../core/cubits/cubit/check_internnet_connection_cubit.dart';
import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/crime_movies_entity/crime_movies_entity.dart';
import '../../../domain/home_repos/home_repos.dart';
part 'crime_movies_state.dart';

class CrimeMoviesCubit extends Cubit<CrimeMoviesState> {
  CrimeMoviesCubit({required this.homeRepos, required this.context})
      : super(CrimeMoviesInitial()) {
    scrollController.addListener(() {
      getCrimeMoviesPagination();
      noInternetConnectionAtendOfList(
          context: context, scrollController: scrollController);
    });
  }

  final HomeRepos homeRepos;
  final BuildContext context;

  ScrollController scrollController = ScrollController();
  List<CrimeMoviesEntity> currentCrimeMovies = [];
  int nextPage = 1;
  bool isPagination = false;
  double oldMaxScroll = 0;
  int oldMoviesLength = 0;

  // create method that get crime movies;
  Future<void> getCrimeMovies({int pageNumber = 1}) async {
    pageNumber == 1
        ? emit(
            CrimeMoviesLoading(),
          )
        : emit(
            CrimeMoviesPaginationLoading(),
          );

    final results = await homeRepos.getCrimeMovies(pageNumber: pageNumber);
    results.fold((failure) {
      if (pageNumber == 1) {
        emit(CrimeMoviesFailure(
          errorMessage: failure.message,
        ));
      } else {
        emit(CrimeMoviesPaginationFailure(
          errorMessage: failure.message,
        ));
      }
    }, (comedyMovies) {
      if (pageNumber == 1) {
        final bool iscurrentMoviesEqualNewMovies =
            checkIfCurrentMoviesEqualNewMovies(
                currentCrimeMovies, comedyMovies);
        if (iscurrentMoviesEqualNewMovies) {
          currentCrimeMovies.clear();
          currentCrimeMovies.addAll(comedyMovies);
          emit(CrimeMoviesSuccess(
            crimeMovies: currentCrimeMovies,
          ));
        } else {
          currentCrimeMovies.clear();
          currentCrimeMovies.addAll(comedyMovies);
          emit(CrimeMoviesSuccess(
            crimeMovies: currentCrimeMovies,
          ));
        }
      } else {
        currentCrimeMovies.addAll(comedyMovies);
        emit(CrimeMoviesPaginationSuccess(
          crimeMovies: currentCrimeMovies,
        ));
      }
    });
  }

  // create method that get crime movies pagination;
  Future<void> getCrimeMoviesPagination() async {
    double currentScroll = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    final isInternetConnected = context.read<InternetConnectionCubit>().state
        is InternetConnectionSuccess;
    if (currentScroll >= maxScroll * 0.7 &&
        !isPagination &&
        state is! CrimeMoviesPaginationLoading &&
        maxScroll >=
            oldMaxScroll +
                (73.1 * (currentCrimeMovies.length - oldMoviesLength))) {
      isPagination = true;
      oldMoviesLength = currentCrimeMovies.length;
      final newPaginaiation = ++nextPage;
      isInternetConnected
          ? await getCrimeMovies(pageNumber: newPaginaiation)
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
