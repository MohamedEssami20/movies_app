import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/cubits/cubit/check_internnet_connection_cubit.dart';
import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../../../core/func/no_internet_at_end_of_list.dart';
import '../../../domain/entities/family_movies_entity/family_movies_entity.dart';
import '../../../domain/home_repos/home_repos.dart';

part 'family_movies_state.dart';

class FamilyMoviesCubit extends Cubit<FamilyMoviesState> {
  FamilyMoviesCubit({required this.homeRepos, required this.context})
      : super(FamilyMoviesInitial()) {
    scrollController.addListener(() {
      getFamilyMoviesPagination();
      noInternetConnectionAtendOfList(
          context: context, scrollController: scrollController);
    });
  }

  final HomeRepos homeRepos;
  final BuildContext context;

  ScrollController scrollController = ScrollController();
  List<FamilyMoviesEntity> currentFamilyMovies = [];
  int nextPage = 1;
  bool isPagination = false;
  double oldMaxScroll = 0;
  int oldMoviesLength = 0;

  // create method that get family movies;
  Future<void> getFamilyMovies({int pageNumber = 1}) async {
    pageNumber == 1
        ? emit(
            FamilyMoviesLoading(),
          )
        : emit(
            FamilyMoviesPaginationLoading(),
          );

    final results = await homeRepos.getFamilyMovies(pageNumber: pageNumber);
    results.fold((failure) {
      if (pageNumber == 1) {
        emit(FamilyMoviesFailure(
          errorMessage: failure.message,
        ));
      } else {
        emit(FamilyMoviesPaginationFailure(
          errorMessage: failure.message,
        ));
      }
    }, (familyMovies) {
      if (pageNumber == 1) {
        final bool iscurrentMoviesEqualNewMovies =
            checkIfCurrentMoviesEqualNewMovies(
                currentFamilyMovies, familyMovies);
        if (iscurrentMoviesEqualNewMovies) {
          currentFamilyMovies.clear();
          currentFamilyMovies.addAll(familyMovies);
          emit(FamilyMoviesSuccess(
            familyMovies: currentFamilyMovies,
          ));
        } else {
          currentFamilyMovies.clear();
          currentFamilyMovies.addAll(familyMovies);
          emit(FamilyMoviesSuccess(
            familyMovies: currentFamilyMovies,
          ));
        }
      } else {
        currentFamilyMovies.addAll(familyMovies);
        emit(FamilyMoviesPaginationSuccess(
          familyMovies: currentFamilyMovies,
        ));
      }
    });
  }

  // create method taht get family movies pagination;
  Future<void> getFamilyMoviesPagination() async {
    double currentScroll = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    final isInternetConnected = context.read<InternetConnectionCubit>().state
        is InternetConnectionSuccess;
    if (currentScroll >= maxScroll * 0.7 &&
        !isPagination &&
        state is! FamilyMoviesPaginationLoading &&
        maxScroll >=
            oldMaxScroll +
                (73.1 * (currentFamilyMovies.length - oldMoviesLength))) {
      isPagination = true;
      oldMoviesLength = currentFamilyMovies.length;
      final newPaginaiation = ++nextPage;
      isInternetConnected
          ? await getFamilyMovies(pageNumber: newPaginaiation)
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
