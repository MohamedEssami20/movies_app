import 'package:flutter/material.dart';

import '../new_release_movies_list_view.dart';
import '../new_release_tvshow_list_view.dart';
import '../now_playing.dart';
import '../recomended_movies_list_view.dart';
import '../title_of_categorie.dart';
import '../trending_movies_list_view.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NowPlaying(),
          const TitleOfCategorie(
            title: 'Trending',
          ),
          SizedBox(
            height: 12,
          ),
          TrendingMoviesListView(),
          const TitleOfCategorie(
            title: 'New Releases - Movies',
          ),
          SizedBox(
            height: 12,
          ),
          NewReleaseMoviesListView(),
          const TitleOfCategorie(
            title: 'New Release - Tv Show',
          ),
          SizedBox(
            height: 12,
          ),
          NewReleaseTvshowListView(),
          const TitleOfCategorie(
            title: 'Recommended',
          ),
          SizedBox(
            height: 12,
          ),
          RecommendedMoviesListView(),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}