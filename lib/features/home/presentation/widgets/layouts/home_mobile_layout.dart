import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/get_it_service.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';
import 'package:movies_app/features/home/presentation/manager/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import '../categories_item_list_view.dart';
import '../choosen_category_movies.dart';
import '../custom_search_field.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
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
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CategoriesItemListView(),
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
            ],
            child: ChoosenCategoryViews(),
          ),
        ),
      ],
    );
  }
}
