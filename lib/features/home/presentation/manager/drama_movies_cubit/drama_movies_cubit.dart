import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/func/no_internet_at_end_of_list.dart';
import 'package:movies_app/features/home/domain/entities/drama_movies_entity/drama_movies_entity.dart';
import '../../../../../core/cubits/cubit/check_internnet_connection_cubit.dart';
import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/home_repos/home_repos.dart';

part 'drama_movies_state.dart';

class DramaMoviesCubit extends Cubit<DramaMoviesState> {
  DramaMoviesCubit({required this.homeRepos, required this.context})
      : super(DramaMoviesInitial()) {
    scrollController.addListener(() {
      getMoreDramaMovies();
      noInternetConnectionAtendOfList(
          context: context, scrollController: scrollController);
    });
  }

  final HomeRepos homeRepos;
  final BuildContext context;

  ScrollController scrollController = ScrollController();
  List<DramaMoviesEntity> currentDramaMovies = [];
  int nextPage = 1;
  bool isPagination = false;
  double oldMaxScroll = 0;
  int oldMoviesLength = 0;

  // create method that get drama movies;
  Future<void> getDramaMovies({int pageNumber = 1}) async {
    pageNumber == 1
        ? emit(
            DramaMoviesLoading(),
          )
        : emit(
            DramaMoviesPaginationLoading(),
          );

    final results = await homeRepos.getDramaMovies(pageNumber: pageNumber);
    results.fold((failure) {
      if (pageNumber == 1) {
        emit(DramaMoviesFailure(
          errorMessage: failure.message,
        ));
      } else {
        emit(DramaMoviesPaginationFailure(
          errorMessage: failure.message,
        ));
      }
    }, (dramaMovies) {
      if (pageNumber == 1) {
        final bool iscurrentMoviesEqualNewMovies =
            checkIfCurrentMoviesEqualNewMovies(currentDramaMovies, dramaMovies);
        if (iscurrentMoviesEqualNewMovies) {
          currentDramaMovies.clear();
          currentDramaMovies.addAll(dramaMovies);
          emit(DramaMoviesSuccess(
            dramaMovies: currentDramaMovies,
          ));
        } else {
          currentDramaMovies.clear();
          currentDramaMovies.addAll(dramaMovies);
          emit(DramaMoviesSuccess(
            dramaMovies: currentDramaMovies,
          ));
        }
      } else {
        currentDramaMovies.addAll(dramaMovies);
        emit(DramaMoviesPaginationSuccess(
          dramaMovies: currentDramaMovies,
        ));
      }
    });
  }

  // create method that get more drama movies;
  Future<void> getMoreDramaMovies() async {
    double currentScroll = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    final isInternetConnected = context.read<InternetConnectionCubit>().state
        is InternetConnectionSuccess;
    if (currentScroll >= maxScroll * 0.7 &&
        !isPagination &&
        state is! DramaMoviesPaginationLoading &&
        maxScroll >=
            oldMaxScroll +
                (73.1 * (currentDramaMovies.length - oldMoviesLength))) {
      isPagination = true;
      oldMoviesLength = currentDramaMovies.length;
      final newPaginaiation = ++nextPage;
      isInternetConnected
          ? await getDramaMovies(pageNumber: newPaginaiation)
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
