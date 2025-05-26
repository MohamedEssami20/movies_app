import 'package:flutter/material.dart';

import '../../../../../core/utils/api_end_points.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/animations_movies_entity/animations_movies_entity.dart';
import '../movies_item.dart';

class AnimationMoviesView extends StatelessWidget {
  const AnimationMoviesView({super.key, required this.animationsMovies, required this.scrollController});
  final List<AnimationsMoviesEntity> animationsMovies;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 12,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Animations Movies",
                style: AppTextStyles.semiBold16(context)
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              key: PageStorageKey("AnimationMoviesListView"),
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > 600 ? 4 : 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return FittedBox(
                  fit: BoxFit.fill,
                  child: MoviesItem(
                    movieTitle: animationsMovies[index].movieTitle,
                    imageUrl: ApiEndPoints.imagebaseUrl +
                        animationsMovies[index].moviePoster.toString(),
                  ),
                );
              },
              itemCount: animationsMovies.length,
            ),
          ),
        ],
      ),
    );
  }
}
