import 'package:flutter/material.dart';
import 'package:movies_app/features/watch_list/domain/watch_list_entity/watch_list_entity.dart';
import 'package:movies_app/features/watch_list/presentation/views/widgets/watch_list_movie_details_and_photo.dart';

class WatchListMovieItem extends StatelessWidget {
  const WatchListMovieItem({
    super.key,
    required this.movie,
  });
  final WatchListEntity movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8),
      width: MediaQuery.sizeOf(context).width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        color: Colors.transparent,
      ),
      child: WatchListMovieDetailsAndPhoto(
        movieDate: movie.movieRelaseDate,
        moviePoster: movie.movieImage,
        movieRate: movie.movieVoteAverage,
        movieTitle: movie.movietitle,
      ),
    );
  }
}
