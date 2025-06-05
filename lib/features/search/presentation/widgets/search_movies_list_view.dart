import 'package:flutter/material.dart';

import '../../domain/entities/search_movies_entity/search_movies_entity.dart';
import 'search_item.dart';

class SearchMoviesListView extends StatelessWidget {
  const SearchMoviesListView({
    super.key, required this.searchMovies,
  });

  final List<SearchMoviesEntity> searchMovies;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: SizedBox(
        height: screenHeight < 650 ? screenHeight * 0.61 : screenHeight * 0.65,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child:  SearchItems(
                      moviePoster: searchMovies[index].moviePoster.toString(),
                      movieName: searchMovies[index].movieTitle,
                      movieDate: searchMovies[index].movieRealseDate,
                      movieRating: searchMovies[index].movieRating.toString(),
                    ),
                  );
                },
                itemCount: searchMovies.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
