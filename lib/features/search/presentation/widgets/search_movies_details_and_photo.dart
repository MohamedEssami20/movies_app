import 'package:flutter/material.dart';

import 'search_movies_details.dart';
import 'search_movies_photo.dart';

class SearchMoviesDetailsAndPhoto extends StatelessWidget {
  const SearchMoviesDetailsAndPhoto({
    super.key,
    required this.moviePoster,
    required this.movieName,
    required this.movieRate,
    required this.movieDate,
  });
  final String moviePoster, movieName, movieRate, movieDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        SearchMoviesPhoto(
          moviePoster: moviePoster,
        ),
        SearchMoviesDetails(
          movieRating: movieRate,
          movieTitle: movieName,
          movieDate: movieDate,
        ),
      ],
    );
  }
}
