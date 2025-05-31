import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/assets.dart';

class SearchMoviesDetails extends StatelessWidget {
  const SearchMoviesDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Text(
              'Spider-man: Across the spider-Verse (2023)',
              style: AppTextStyles.medium16(context).copyWith(
                color: Colors.white,
              ),
              maxLines: null,
              overflow: TextOverflow.visible,
            ),
            Row(
              spacing: 10,
              children: [
                SvgPicture.asset(
                  Assets.assetsImagesCalenderIcon,
                ),
                Text(
                  '2023',
                  style: AppTextStyles.medium16(context).copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.star, color: Colors.white, size: 20),
                Text(
                  '8.5',
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