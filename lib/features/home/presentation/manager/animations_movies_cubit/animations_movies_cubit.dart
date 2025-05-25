import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/func/no_internet_at_end_of_list.dart';
import '../../../../../core/cubits/cubit/check_internnet_connection_cubit.dart';
import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../domain/entities/animations_movies_entity/animations_movies_entity.dart';
import '../../../domain/home_repos/home_repos.dart';

part 'animations_movies_state.dart';

class AnimationsMoviesCubit extends Cubit<AnimationsMoviesState> {
  AnimationsMoviesCubit({required this.homeRepos, required this.context})
      : super(AnimationsMoviesInitial()) {
    scrollController.addListener(() {
      getMoreAnimationsMovies();
      noInternetConnectionAtendOfList(
          context: context, scrollController: scrollController);
    });
  }

  final HomeRepos homeRepos;
  final BuildContext context;

  ScrollController scrollController = ScrollController();
  List<AnimationsMoviesEntity> currentAnimationsMovies = [];
  int nextPage = 1;
  bool isPagination = false;
  double oldMaxScroll = 0;
  int oldMoviesLength = 0;

  // create method that get animations movies;
  Future<void> getAnimationsMovies({int pageNumber = 1}) async {
    pageNumber == 1
        ? emit(
            AnimationsMoviesLoading(),
          )
        : emit(
            AnimationsMoviesPaginationLoading(),
          );

    final results = await homeRepos.getAnimationsMovies(pageNumber: pageNumber);
    results.fold((failure) {
      if (pageNumber == 1) {
        emit(AnimationsMoviesFailure(
          errorMessage: failure.message,
        ));
      } else {
        emit(AnimationsMoviesPaginationFailure(
          errorMessage: failure.message,
        ));
      }
    }, (animationsMovies) {
      if (pageNumber == 1) {
        final bool iscurrentMoviesEqualNewMovies =
            checkIfCurrentMoviesEqualNewMovies(
                currentAnimationsMovies, animationsMovies);
        if (iscurrentMoviesEqualNewMovies) {
          currentAnimationsMovies.clear();
          currentAnimationsMovies.addAll(animationsMovies);
          emit(AnimationsMoviesSuccess(
            animationsMovies: currentAnimationsMovies,
          ));
        } else {
          currentAnimationsMovies.clear();
          currentAnimationsMovies.addAll(animationsMovies);
          emit(AnimationsMoviesSuccess(
            animationsMovies: currentAnimationsMovies,
          ));
        }
      } else {
        currentAnimationsMovies.addAll(animationsMovies);
        emit(AnimationsMoviesPaginationSuccess(
          animationsMovies: currentAnimationsMovies,
        ));
      }
    });
  }

  // create method that get more animations movies;
  Future<void> getMoreAnimationsMovies() async {
    double currentScroll = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    final isInternetConnected = context.read<InternetConnectionCubit>().state
        is InternetConnectionSuccess;
    if (currentScroll >= maxScroll * 0.7 &&
        !isPagination &&
        state is! AnimationsMoviesPaginationLoading &&
        maxScroll >=
            oldMaxScroll +
                (73.1 * (currentAnimationsMovies.length - oldMoviesLength))) {
      isPagination = true;
      oldMoviesLength = currentAnimationsMovies.length;
      final newPaginaiation = ++nextPage;
      isInternetConnected
          ? await getAnimationsMovies(pageNumber: newPaginaiation)
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
