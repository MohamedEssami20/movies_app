import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/cubits/cubit/check_internnet_connection_cubit.dart';
import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/up_coming_movies_entity/up_coming_movies_entity.dart';
import '../../../domain/home_repos/home_repos.dart';
part 'up_coming_movies_state.dart';

class UpComingMoviesCubit extends Cubit<UpComingMoviesState> {
  UpComingMoviesCubit(this.homeRepos, this.context)
      : super(UpComingMoviesInitial()) {
    scrollController.addListener(() {
      getMoreUpComingMovies();
    });
  }
  final HomeRepos homeRepos;
  final BuildContext context;
  final List<UpComingMoviesEntity> currentUpComingMovies = []; //.obs;
  int nextPage = 1;
  bool isPagination = false;
  double oldMaxScroll = 0;
  int oldMoviesLength = 0;
  final ScrollController scrollController = ScrollController();
  //create method that get up coming movies;
  Future<void> getUpComingMovies({pageNumber = 1}) async {
    pageNumber == 1
        ? emit(
            UpComingMoviesLoading(),
          )
        : emit(
            UpComingMoviesPaginationLoading(),
          );
    final result = await homeRepos.getUpComingMovies();
    result.fold((faliure) {
      pageNumber == 1
          ? emit(
              UpComingMoviesFailure(errorMessage: faliure.message),
            )
          : emit(
              UpComingMoviesPaginationFailure(errorMessage: faliure.message),
            );
    }, (upComingMovies) {
      if (pageNumber == 1) {
        final bool iscurrentMovieEqualNewMovies =
            checkIfCurrentMoviesEqualNewMovies(
                currentUpComingMovies, upComingMovies);
        if (iscurrentMovieEqualNewMovies) {
          currentUpComingMovies.clear();
          currentUpComingMovies.addAll(upComingMovies);
          emit(
            UpComingMoviesSuccess(upComingMovies: currentUpComingMovies),
          );
        } else {
          currentUpComingMovies.clear();
          currentUpComingMovies.addAll(upComingMovies);
          emit(
            UpComingMoviesSuccess(upComingMovies: currentUpComingMovies),
          );
        }
      } else {
        currentUpComingMovies.addAll(upComingMovies);
        emit(
          UpComingMoviesPaginationSuccess(
              upComingMovies: currentUpComingMovies),
        );
      }
    });
  }

// create method that get more up coming movies;
  Future<void> getMoreUpComingMovies() async {
    final currentScroll = scrollController.position.pixels;
    final maxScroll = scrollController.position.maxScrollExtent;
    final isInternetConnected = context.read<InternetConnectionCubit>().state
        is InternetConnectionSuccess;
    if (currentScroll >= maxScroll * 0.7 &&
        !isPagination &&
        state is! UpComingMoviesPaginationLoading &&
        maxScroll >=
            oldMaxScroll +
                (152.4 * (currentUpComingMovies.length - oldMoviesLength))) {
      isPagination = true;
      oldMoviesLength = currentUpComingMovies.length;
      final newPaginaiation = ++nextPage;
      isInternetConnected
          ? await getUpComingMovies(pageNumber: newPaginaiation)
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
