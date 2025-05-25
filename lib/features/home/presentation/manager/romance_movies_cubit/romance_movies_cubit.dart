import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/func/no_internet_at_end_of_list.dart';
import '../../../../../core/cubits/cubit/check_internnet_connection_cubit.dart';
import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/romance_movies_entity/romance_movies_entity.dart';
import '../../../domain/home_repos/home_repos.dart';

part 'romance_movies_state.dart';

class RomanceMoviesCubit extends Cubit<RomanceMoviesState> {
  RomanceMoviesCubit({required this.homeRepos, required this.context})
      : super(RomanceMoviesInitial()) {
    scrollController.addListener(() {
      getRomanceMoviesPagination();
      noInternetConnectionAtendOfList(
          context: context, scrollController: scrollController);
    });
  }

  final HomeRepos homeRepos;
  final BuildContext context;

  ScrollController scrollController = ScrollController();
  List<RomanceMoviesEntity> currentRomanceMovies = [];
  int nextPage = 1;
  bool isPagination = false;
  double oldMaxScroll = 0;
  int oldMoviesLength = 0;

  // create all states of romance movies;
  Future<void> getRomanceMovies({int pageNumber = 1}) async {
    pageNumber == 1
        ? emit(
            RomanceMoviesLoading(),
          )
        : emit(
            RomanceMoviesPaginationLoading(),
          );

    final results = await homeRepos.getRomanceMovies(pageNumber: pageNumber);
    results.fold((failure) {
      if (pageNumber == 1) {
        emit(RomanceMoviesFailure(
          errorMessage: failure.message,
        ));
      } else {
        emit(RomanceMoviesPaginationFailure(
          errorMessage: failure.message,
        ));
      }
    }, (romanceMovies) {
      if (pageNumber == 1) {
        final bool iscurrentMoviesEqualNewMovies =
            checkIfCurrentMoviesEqualNewMovies(
                currentRomanceMovies, romanceMovies);
        if (iscurrentMoviesEqualNewMovies) {
          currentRomanceMovies.clear();
          currentRomanceMovies.addAll(romanceMovies);
          emit(RomanceMoviesSuccess(
            romanceMovies: currentRomanceMovies,
          ));
        } else {
          currentRomanceMovies.clear();
          currentRomanceMovies.addAll(romanceMovies);
          emit(RomanceMoviesSuccess(
            romanceMovies: currentRomanceMovies,
          ));
        }
      } else {
        currentRomanceMovies.addAll(romanceMovies);
        emit(RomanceMoviesPaginationSuccess(
          romanceMovies: currentRomanceMovies,
        ));
      }
    });
  }

  // create all state of pagination of romance movies;
  Future<void> getRomanceMoviesPagination() async {
    double currentScroll = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    final isInternetConnected = context.read<InternetConnectionCubit>().state
        is InternetConnectionSuccess;
    if (currentScroll >= maxScroll * 0.7 &&
        !isPagination &&
        state is! RomanceMoviesPaginationLoading &&
        maxScroll >=
            oldMaxScroll +
                (73.1 * (currentRomanceMovies.length - oldMoviesLength))) {
      isPagination = true;
      oldMoviesLength = currentRomanceMovies.length;
      final newPaginaiation = ++nextPage;
      isInternetConnected
          ? await getRomanceMovies(pageNumber: newPaginaiation)
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
