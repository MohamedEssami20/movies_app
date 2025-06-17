import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/api_end_points.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_shimmer_widget.dart'
    show CustomShimmer;
import 'custom_details_movies_button.dart';

class MoviesImageReviewDetails extends StatelessWidget {
  const MoviesImageReviewDetails({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: ApiEndPoints.imagebaseUrl + imageUrl,
          fit: BoxFit.fill,
          height: 0.40 * height,
          width: double.infinity,
          errorWidget: (context, url, error) {
            return Icon(
              Icons.error_outline,
              color: Colors.white,
            );
          },
          placeholder: (context, url) {
            return CustomShimmer(
              aspectRatio: 1.6,
            );
          },
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: height * 0.04,
                  ),
                ),
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                  size: height * 0.04,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          top: 0,
          bottom: -0.10 * height,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomDetailsMoviesButton(
                  onPressed: () {},
                  title: 'Watch Now',
                  icon: SvgPicture.asset(
                    Assets.assetsImagesVideoIcon,
                    height: 28,
                  ),
                  color: Color(0xFFFF1700),
                ),
              ),
              Expanded(
                child: CustomDetailsMoviesButton(
                  onPressed: () {},
                  title: 'Download',
                  icon: SvgPicture.asset(
                    Assets.assetsImagesDownloadIcon,
                    height: 28,
                  ),
                  color: Color(0xFFFF1700),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
