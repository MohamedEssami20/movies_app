import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/get_it_service.dart';
import 'package:movies_app/features/home/presentation/manager/categories_items/categories_items_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import '../../../domain/home_repos/home_repos.dart';
import '../../manager/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import '../../manager/top_rating_movies/top_rating_movies_cubit.dart';
import '../../manager/trending_movies_cubit/trending_movies_cubit.dart';
import '../categories_item_list_view.dart';
import '../choosen_category_movies.dart';
import '../custom_search_field.dart';

class HomeTabletLayout extends StatelessWidget {
  const HomeTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        overscroll: false,
        physics: BouncingScrollPhysics(),
      ),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: CustomSearchField(
              onChanged: (value) {},
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
            child: BlocProvider(
              create: (context) => CategoriesItemsCubit(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CategoriesItemListView(),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => NowPlayingMoviesCubit(
                  getIt.get<HomeRepos>(),
                )..getNowPlayingMovies(),
              ),
              BlocProvider(
                create: (context) => PopularMoviesCubit(
                  homeRepos: getIt.get<HomeRepos>(),
                )..getPopularMovies(),
              ),
              BlocProvider(
                create: (context) => TrendingMoviesCubit(
                  homeRepos: getIt.get<HomeRepos>(),
                )..getTrendingMovies(),
              ),
              BlocProvider(
                create: (context) => TopRatingMoviesCubit(
                  getIt.get<HomeRepos>(),
                )..getTopRatingMovies(),
              ),
            ],
            child: ChoosenCategoryViews(),
          ),
        ),
      ],
    );
  }
}
