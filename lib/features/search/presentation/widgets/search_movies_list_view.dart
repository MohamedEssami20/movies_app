import 'package:flutter/material.dart';

import '../../domain/entities/search_movies_entity/search_movies_entity.dart';
import 'search_item.dart';

class SearchMoviesListView extends StatelessWidget {
  const SearchMoviesListView({
    super.key,
    required this.searchMovies, required this.scrollController,
  });

  final List<SearchMoviesEntity> searchMovies;
  final ScrollController scrollController ;
  @override
  Widget build(BuildContext context) {
    //final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: SearchItems(
              moviePoster: searchMovies[index].moviePoster.toString(),
              movieName: searchMovies[index].movieTitle,
              movieDate: searchMovies[index].movieRealseDate,
              movieRating: searchMovies[index].movieRating.toString(),
            ),
          );
        },
        itemCount: searchMovies.length,
      ),
    );
  }
}
