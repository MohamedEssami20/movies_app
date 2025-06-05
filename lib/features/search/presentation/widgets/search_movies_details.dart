import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/assets.dart';

class SearchMoviesDetails extends StatelessWidget {
  const SearchMoviesDetails({
    super.key, required this.movieTitle, required this.movieDate, required this.movieRating,
  });
  final String movieTitle, movieDate, movieRating;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Text(
              movieTitle,
              style: AppTextStyles.medium16(context).copyWith(
                color: Colors.white,
              ),
              maxLines: null,
              overflow: TextOverflow.visible,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                SvgPicture.asset(
                  Assets.assetsImagesCalenderIcon,
                ),
                Text(
                  movieDate,
                  style: AppTextStyles.medium16(context).copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 6),
                Icon(Icons.star, color: Colors.white, size: 20),
                Text(
                  movieRating,
                  style: AppTextStyles.medium16(context).copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
