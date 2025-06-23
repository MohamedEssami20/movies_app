import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';

import '../../../../../core/utils/assets.dart';

class WatchListMoviesDetails extends StatelessWidget {
  const WatchListMoviesDetails({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            "movie title name",
            style: AppTextStyles.medium16(context).copyWith(
              color: Colors.white,
            ),
            maxLines: null,
            overflow: TextOverflow.visible,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            spacing: 8,
            children: [
              SvgPicture.asset(
                Assets.assetsImagesCalenderIcon,
              ),
              Text(
                "21-01-2023",
                style: AppTextStyles.medium16(context).copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 6),
              Icon(Icons.star, color: Colors.white, size: 20),
              Text(
                "12",
                style: AppTextStyles.medium16(context).copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
