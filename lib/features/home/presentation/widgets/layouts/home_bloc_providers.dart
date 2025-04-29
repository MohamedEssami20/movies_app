import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/get_it_service.dart';
import '../../../domain/home_repos/home_repos.dart';
import '../../manager/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import '../../manager/popular_movies_cubit/popular_movies_cubit.dart';
import '../../manager/top_rating_movies/top_rating_movies_cubit.dart';
import '../../manager/trending_movies_cubit/trending_movies_cubit.dart';
import '../../manager/up_coming_movies_cubit/up_coming_movies_cubit.dart';
import '../choosen_category_movies.dart';

class HomeBlocProviders extends StatelessWidget {
  const HomeBlocProviders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NowPlayingMoviesCubit(
            getIt.get<HomeRepos>(),
          )..getNowPlayingMovies(),
        ),
        BlocProvider(
          create: (context) => PopularMoviesCubit(
            homeRepos: getIt.get<HomeRepos>(),
            context,
          )..getPopularMovies(),
        ),
        BlocProvider(
          create: (context) => TrendingMoviesCubit(
            homeRepos: getIt.get<HomeRepos>(),
            context: context,
          )..getTrendingMovies(),
        ),
        BlocProvider(
          create: (context) => TopRatingMoviesCubit(
            getIt.get<HomeRepos>(),
            context,
          )..getTopRatingMovies(),
        ),
        BlocProvider(
          create: (context) => UpComingMoviesCubit(
            getIt.get<HomeRepos>(), 
            context,
          )..getUpComingMovies(),
        ),
      ],
      child: ChoosenCategoryViews(),
    );
  }
}