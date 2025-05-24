import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/cubits/cubit/check_internnet_connection_cubit.dart';
import '../../../../../core/func/check_if_new_movies_equal_current_movies.dart';
import '../../../../../core/func/no_internet_at_end_of_list.dart';
import '../../../domain/entities/adventure_movies_entity/adventure_movies_entity.dart';
import '../../../domain/home_repos/home_repos.dart';
part 'adventure_movies_state.dart';

class AdventureMoviesCubit extends Cubit<AdventureMoviesState> {
  AdventureMoviesCubit({required this.homeRepos, required this.context})
      : super(AdventureMoviesInitial()) {
    scrollController.addListener(() {
      getMoreAdventureMovies();
      noInternetConnectionAtendOfList(
          context: context, scrollController: scrollController);
    });
  }

  final HomeRepos homeRepos;
  final BuildContext context;

  ScrollController scrollController = ScrollController();
  List<AdventureMoviesEntity> currentAdventureMovies = [];
  int nextPage = 1;
  bool isPagination = false;
  double oldMaxScroll = 0;
  int oldMoviesLength = 0;

  // create method that get adventure movies;
  Future<void> getAdventureMovies({int pageNumber = 1}) async {
    pageNumber == 1
        ? emit(
            AdventureMoviesLoading(),
          )
        : emit(
            AdventureMoviesPaginationLoading(),
          );
    final results = await homeRepos.getAdventureMovies(pageNumber: pageNumber);
    results.fold((failure) {
      if (pageNumber == 1) {
        emit(AdventureMoviesFailure(
          errorMessage: failure.message,
        ));
      } else {
        emit(AdventureMoviesPaginationFailure(
          errorMessage: failure.message,
        ));
      }
    }, (adventureMovies) {
      if (pageNumber == 1) {
        final bool iscurrentMoviesEqualNewMovies =
            checkIfCurrentMoviesEqualNewMovies(
                currentAdventureMovies, adventureMovies);
        if (iscurrentMoviesEqualNewMovies) {
          currentAdventureMovies.clear();
          currentAdventureMovies.addAll(adventureMovies);
          emit(AdventureMoviesSuccess(
            adventureMovies: currentAdventureMovies,
          ));
        } else {
          currentAdventureMovies.clear();
          currentAdventureMovies.addAll(adventureMovies);
          emit(AdventureMoviesSuccess(
            adventureMovies: currentAdventureMovies,
          ));
        }
      } else {
        currentAdventureMovies.addAll(adventureMovies);
        emit(AdventureMoviesPaginationSuccess(
          adventureMovies: currentAdventureMovies,
        ));
      }
    });
  }

  // create method that get more adventure movies
  Future<void> getMoreAdventureMovies() async {
    double currentScroll = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    final isInternetConnected = context.read<InternetConnectionCubit>().state
        is InternetConnectionSuccess;
    if (currentScroll >= maxScroll * 0.7 &&
        !isPagination &&
        state is! AdventureMoviesPaginationLoading &&
        maxScroll >=
            oldMaxScroll +
                (73.1 * (currentAdventureMovies.length - oldMoviesLength))) {
      isPagination = true;
      oldMoviesLength = currentAdventureMovies.length;
      final newPaginaiation = ++nextPage;
      isInternetConnected
          ? await getAdventureMovies(pageNumber: newPaginaiation)
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
