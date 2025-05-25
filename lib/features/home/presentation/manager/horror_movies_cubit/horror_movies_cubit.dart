import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/func/no_internet_at_end_of_list.dart';
import '../../../../../core/cubits/cubit/check_internnet_connection_cubit.dart';
import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/horror_movies_entity/horror_movies_entity.dart';
import '../../../domain/home_repos/home_repos.dart';

part 'horror_movies_state.dart';

class HorrorMoviesCubit extends Cubit<HorrorMoviesState> {
  HorrorMoviesCubit({required this.homeRepos, required this.context})
      : super(HorrorMoviesInitial()) {
    scrollController.addListener(() {
      getHorrorMoviesPagination();
      noInternetConnectionAtendOfList(
          context: context, scrollController: scrollController);
    });
  }

  final HomeRepos homeRepos;
  final BuildContext context;

  ScrollController scrollController = ScrollController();
  List<HorrorMoviesEntity> currentHorrorMovies = [];
  int nextPage = 1;
  bool isPagination = false;
  double oldMaxScroll = 0;
  int oldMoviesLength = 0;

  // create get horror movies method;
  Future<void> getHorrorMovies({int pageNumber = 1}) async {
    pageNumber == 1
        ? emit(
            HorrorMoviesLoading(),
          )
        : emit(
            HorrorMoviesPaginationLoading(),
          );

    final results = await homeRepos.getHorrorMovies(pageNumber: pageNumber);
    results.fold((failure) {
      if (pageNumber == 1) {
        emit(HorrorMoviesFailure(
          errorMessage: failure.message,
        ));
      } else {
        emit(HorrorMoviesPaginationFailure(
          errorMessage: failure.message,
        ));
      }
    }, (horrorMovies) {
      if (pageNumber == 1) {
        final bool iscurrentMoviesEqualNewMovies =
            checkIfCurrentMoviesEqualNewMovies(
                currentHorrorMovies, horrorMovies);
        if (iscurrentMoviesEqualNewMovies) {
          currentHorrorMovies.clear();
          currentHorrorMovies.addAll(horrorMovies);
          emit(HorrorMoviesSuccess(
            horrorMovies: currentHorrorMovies,
          ));
        } else {
          currentHorrorMovies.clear();
          currentHorrorMovies.addAll(horrorMovies);
          emit(HorrorMoviesSuccess(
            horrorMovies: currentHorrorMovies,
          ));
        }
      } else {
        currentHorrorMovies.addAll(horrorMovies);
        emit(HorrorMoviesPaginationSuccess(
          horrorMovies: currentHorrorMovies,
        ));
      }
    });
  }

  // create get horror movies pagination method;
  Future<void> getHorrorMoviesPagination() async {
    double currentScroll = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    final isInternetConnected = context.read<InternetConnectionCubit>().state
        is InternetConnectionSuccess;
    if (currentScroll >= maxScroll * 0.7 &&
        !isPagination &&
        state is! HorrorMoviesPaginationLoading &&
        maxScroll >=
            oldMaxScroll +
                (73.1 * (currentHorrorMovies.length - oldMoviesLength))) {
      isPagination = true;
      oldMoviesLength = currentHorrorMovies.length;
      final newPaginaiation = ++nextPage;
      isInternetConnected
          ? await getHorrorMovies(pageNumber: newPaginaiation)
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
