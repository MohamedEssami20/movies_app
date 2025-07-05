import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';

import '../../../../../core/utils/assets.dart';

class WatchListMoviesDetails extends StatelessWidget {
  const WatchListMoviesDetails({
    super.key,
    required this.movieTitle,
    required this.movieDate,
    required this.movieRate,
  });
  final String movieTitle, movieDate;
  final double movieRate;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 8,
            children: [
              Baseline(
                baseline: 22,
                baselineType: TextBaseline.alphabetic,
                child: SvgPicture.asset(
                  Assets.assetsImagesCalenderIcon,
                ),
              ),
              Text(
                movieDate.isEmpty ? 'N/A' : movieDate,
                style: AppTextStyles.medium16(context).copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 5),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 5,
                children: [
                  Baseline(
                    baseline: 20,
                    baselineType: TextBaseline.alphabetic,
                    child: Icon(Icons.star, color: Colors.white, size: 20),
                  ),
                  Text(
                    movieRate.toString().substring(0, 3),
                    style: AppTextStyles.medium16(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
