import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/manager/adventure_movies_cubit/adventure_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/animations_movies_cubit/animations_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/comedy_movies_cubit/comedy_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/crime_movies_cubit/crime_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/drama_movies_cubit/drama_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/family_movies/family_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/horror_movies_cubit/horror_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/romance_movies_cubit/romance_movies_cubit.dart';

import '../../../../../core/services/get_it_service.dart';
import '../../../domain/home_repos/home_repos.dart';
import '../../manager/action_movies/action_movies_cubit.dart';
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
        BlocProvider(
          create: (context) => ActionMoviesCubit(
            context: context,
            homeRepos: getIt.get<HomeRepos>(),
          )..getActionMovies(),
        ),
       
        BlocProvider(create: (context) {
          return AdventureMoviesCubit(
            homeRepos: getIt.get<HomeRepos>(),
            context: context,
          )..getAdventureMovies();
        }),
        BlocProvider(create: (context) {
          return ComedyMoviesCubit(
            homeRepos: getIt.get<HomeRepos>(),
            context: context,
          )..getComedyMovies();
        }),
         BlocProvider(create: (context) {
          return CrimeMoviesCubit(
            homeRepos: getIt.get<HomeRepos>(),
            context: context,
          )..getCrimeMovies();
        }),
         BlocProvider(create: (context) {
          return AnimationsMoviesCubit(
            homeRepos: getIt.get<HomeRepos>(),
            context: context,
          )..getAnimationsMovies();
        }),
        BlocProvider(create: (context) {
          return DramaMoviesCubit(
            homeRepos: getIt.get<HomeRepos>(),
            context: context,
          )..getDramaMovies();
        }),
        BlocProvider(create: (context) {
          return FamilyMoviesCubit(
            homeRepos: getIt.get<HomeRepos>(),
            context: context,
          )..getFamilyMovies();
        }),
        BlocProvider(create: (context) {
          return HorrorMoviesCubit(
            homeRepos: getIt.get<HomeRepos>(),
            context: context,
          )..getHorrorMovies();
        }),
        BlocProvider(create: (context) {
          return RomanceMoviesCubit(
            homeRepos: getIt.get<HomeRepos>(),
            context: context,
          )..getRomanceMovies();
        }),

      ],
      child: ChoosenCategoryViews(),
    );
  }
}
