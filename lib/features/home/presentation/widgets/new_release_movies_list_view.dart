import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/widgets/new_release_movies_item.dart';

class NewReleaseMoviesListView extends StatelessWidget {
  const NewReleaseMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 194,
        child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 16),
                child: NewReleaseMoviesItem(),
              );
            }),
      ),
    );
  }
}
