
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_text_styles.dart' show AppTextStyles;
import '../../../../../core/utils/assets.dart' show Assets;
import 'movie_type_item_details.dart';

class MoviesTypeAndTime extends StatelessWidget {
  const MoviesTypeAndTime({
    super.key,
    required this.moviesGenres,
    required this.moviesDuration,
  });
  final List<String> moviesGenres;
  final int moviesDuration;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Row(
      spacing: 8,
      children: [
        Row(
          children: moviesGenres.isNotEmpty
              ? moviesGenres
                  .map((elemnent) => MoviesTypeItemDetails(title: elemnent))
                  .toList()
              : [],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              spacing: 8,
              children: [
                SvgPicture.asset(
                  Assets.assetsImagesTimeMoviesIcon,
                  height: 18,
                ),
                Text(
                  width > 399
                      ? '${(moviesDuration / 60).toInt().floor()}h ${(moviesDuration % 60).toInt()}min'
                      : '${(moviesDuration / 60).toInt().floor()}h',
                  style: AppTextStyles.medium16(context)
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
