import 'package:flutter/material.dart';
import 'package:movies_app/features/watch_list/presentation/views/widgets/watch_list_moive_photo.dart';

import 'watch_list_movies_details.dart';

class WatchListMovieDetailsAndPhoto extends StatelessWidget {
  const WatchListMovieDetailsAndPhoto({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        WatchListMoivePhoto(),
        WatchListMoviesDetails(),
      ],
    );
  }
}
