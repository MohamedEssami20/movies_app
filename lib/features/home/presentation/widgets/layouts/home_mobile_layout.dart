import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/manager/categories_items/categories_items_cubit.dart';
import 'package:movies_app/features/home/presentation/widgets/new_release_tvshow_list_view.dart';
import 'package:movies_app/features/home/presentation/widgets/recomended_movies_list_view.dart';
import '../categories_item_list_view.dart';
import '../custom_search_field.dart';
import '../new_release_movies_list_view.dart';
import '../title_of_categorie.dart';
import '../trending_movies_list_view.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
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
          child: const TitleOfCategorie(
            title: 'Trending',
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 12,
          ),
        ),
        SliverToBoxAdapter(
          child: TrendingMoviesListView(),
        ),
        SliverToBoxAdapter(
          child: const TitleOfCategorie(
            title: 'New Releases - Movies',
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 12,
          ),
        ),
        SliverToBoxAdapter(
          child: NewReleaseMoviesListView(),
        ),
        SliverToBoxAdapter(
          child: const TitleOfCategorie(
            title: 'New Release - Tv Show',
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 12,
          ),
        ),
        SliverToBoxAdapter(
          child: NewReleaseTvshowListView(),
        ),
        SliverToBoxAdapter(
          child: const TitleOfCategorie(
            title: 'Recommended',
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 12,
          ),
        ),
        SliverToBoxAdapter(
          child: RecommendedMoviesListView(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
      ],
    );
  }
}
