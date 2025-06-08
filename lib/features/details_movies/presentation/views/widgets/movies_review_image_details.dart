import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_text_styles.dart' show AppTextStyles;
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_shimmer_widget.dart'
    show CustomShimmer;

class MoviesImageReviewDetails extends StatelessWidget {
  const MoviesImageReviewDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              "https://image.tmdb.org/t/p/original/yBDvgpyynDsbMyK21FoQu1c2wYR.jpg",
          fit: BoxFit.fill,
          height: 0.40 * height,
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
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: height * 0.04,
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
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    backgroundColor: const Color(0xFFFF1700),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        flex: 4,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Watch Now',
                            style: AppTextStyles.regular16(context)
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          Assets.assetsImagesVideoIcon,
                          height: 28,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    backgroundColor: const Color(0xFFFF1700),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        flex: 4,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Download',
                            style: AppTextStyles.regular16(context)
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          Assets.assetsImagesDownloadIcon,
                          height: 28,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
