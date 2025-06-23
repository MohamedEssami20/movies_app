import 'package:flutter/material.dart';
import 'package:movies_app/features/watch_list/presentation/views/widgets/watch_list_movies_list_view.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: WatchListMoviesListView(),
        ),
      ],
    );
  }
}
