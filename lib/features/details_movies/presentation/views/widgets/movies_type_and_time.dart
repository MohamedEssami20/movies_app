import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_text_styles.dart' show AppTextStyles;
import '../../../../../core/utils/assets.dart' show Assets;
import 'movie_type_item_details.dart';

class MoviesTypeAndTime extends StatelessWidget {
  const MoviesTypeAndTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  final  double width = MediaQuery.sizeOf(context).width;
    return Row(
      spacing: 8,
      children: [
        MoviesTypeItemDetails(title: 'Action'),
        MoviesTypeItemDetails(title: 'Drama'),
        MoviesTypeItemDetails(title: 'Crime'),
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
                  width > 399 ? '2h 32m' : '2h',
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