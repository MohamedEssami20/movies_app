import 'package:flutter/material.dart';

import '../../../../../core/utils/api_end_points.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/crime_movies_entity/crime_movies_entity.dart';
import '../movies_item.dart';

class CrimeMoviesView extends StatelessWidget {
  const CrimeMoviesView({super.key, required this.crimeMoviesEntity, required this.scrollController});
  final List<CrimeMoviesEntity> crimeMoviesEntity;
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
                "Crime Movies",
                style: AppTextStyles.semiBold16(context)
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              key: PageStorageKey("CrimeMoviesListView"),
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
                    movieTitle: crimeMoviesEntity[index].movieTitle,
                     imageUrl: ApiEndPoints.imagebaseUrl +
                        crimeMoviesEntity[index].moviePoster.toString(),
                  ),
                );
              },
              itemCount: crimeMoviesEntity.length,
            ),
          ),
        ],
      ),
    );
  }
}
