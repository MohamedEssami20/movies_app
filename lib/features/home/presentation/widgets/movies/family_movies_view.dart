import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/entities/family_movies_entity/family_movies_entity.dart';

import '../../../../../core/utils/api_end_points.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../movies_item.dart';

class FamilyMoviesView extends StatelessWidget {
  const FamilyMoviesView(
      {super.key, required this.familyMovies, required this.scrollController});
  final List<FamilyMoviesEntity> familyMovies;
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
                "Family Movies",
                style: AppTextStyles.semiBold16(context)
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              key: PageStorageKey("FamilyMoviesListView"),
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
                    movieTitle: familyMovies[index].movieTitle,
                    imageUrl: ApiEndPoints.imagebaseUrl +
                        familyMovies[index].moviePoster.toString(),
                  ),
                );
              },
              itemCount: familyMovies.length,
            ),
          ),
        ],
      ),
    );
  }
}
