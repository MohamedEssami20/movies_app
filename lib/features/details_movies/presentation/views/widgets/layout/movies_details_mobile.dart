import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/assets.dart';
import '../../../../../../core/utils/app_text_styles.dart' show AppTextStyles;
import '../../../../../../core/widgets/custom_shimmer_widget.dart'
    show CustomShimmer;
import '../movies_review_image_details.dart' show MoviesImageReviewDetails;

class MoviesDetailsMobile extends StatelessWidget {
  const MoviesDetailsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MoviesImageReviewDetails(),
        MoviesTitleAndOtherDetails(),
      ],
    );
  }
}

class MoviesTitleAndOtherDetails extends StatelessWidget {
  const MoviesTitleAndOtherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Dark Knight Rises',
            textAlign: TextAlign.left,
            style:
                AppTextStyles.semiBold24(context).copyWith(color: Colors.white),
          ),
          Row(spacing: 8, children: [
            MoviesTypeItemDetails(title: 'Action'),
            MoviesTypeItemDetails(title: 'Drama'),
            MoviesTypeItemDetails(title: 'Crime'),
            const SizedBox(width: 12),
            SvgPicture.asset(Assets.assetsImagesTimeMoviesIcon),
            Expanded(
              child: Text(
                width < 420 ? '2h 32m' : '2h',
                style: AppTextStyles.medium16(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class MoviesTypeItemDetails extends StatelessWidget {
  const MoviesTypeItemDetails({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Text(title, style: AppTextStyles.regular16(context)),
        ],
      ),
    );
  }
}
