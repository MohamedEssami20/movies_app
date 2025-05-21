import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/entities/action_movies_entity/action_movies_entity.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_item.dart';

import '../../../../../core/utils/api_end_points.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ActionMoviesView extends StatelessWidget {
  const ActionMoviesView({super.key, required this.actionMovies, required this.scrollController});
  final List<ActionMoviesEntity> actionMovies;
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
                "Action Movies",
                style: AppTextStyles.semiBold16(context)
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              key: PageStorageKey("ActionMoviesListView"),
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
                    imageUrl:
                        ApiEndPoints.imagebaseUrl + actionMovies[index].moviePoster.toString(),
                    movieTitle: actionMovies[index].movieTitle,
                  ),
                );
              },
              itemCount: actionMovies.length,
            ),
          ),
        ],
      ),
    );
  }
}
