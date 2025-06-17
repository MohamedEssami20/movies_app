import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_text_styles.dart' show AppTextStyles;
import '../../../../../core/utils/assets.dart';

class MovieRelaseDateAndReviews extends StatelessWidget {
  const MovieRelaseDateAndReviews(
      {super.key,
      required this.relaseDate,
      required this.voteCount,
      required this.voteAverage});
  final String relaseDate;
  final int voteCount;
  final double voteAverage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        Row(
          spacing: 8,
          children: [
            SvgPicture.asset(Assets.assetsImagesCalenderIcon, height: 18),
            Text(
              relaseDate.substring(0, 4),
              style: AppTextStyles.medium16(context)
                  .copyWith()
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
        const SizedBox(width: 14),
        Row(
          spacing: 8,
          children: [
            Icon(Icons.star, color: Colors.white, size: 18),
            Text(
              voteAverage.toString(),
              style: AppTextStyles.medium16(context)
                  .copyWith()
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
        const SizedBox(width: 14),
        Flexible(
          flex: 3,
          child: Text(
           voteCount==0? "0 reviews": "${voteCount}k Reviews",
            style:
                AppTextStyles.regular16(context).copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}
