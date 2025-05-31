
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/app_text_styles.dart';

class MoviesItem extends StatelessWidget {
  const MoviesItem({
    super.key,
    required this.imageUrl,
    required this.movieTitle,
  });
  final String imageUrl, movieTitle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            child: AspectRatio(
              aspectRatio: 0.80,
              child: FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  height: 165,
                  width: 160,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    memCacheHeight: 165,
                    memCacheWidth: 160,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) {
                      return Icon(
                        Icons.error_outline,
                        color: Colors.white,
                      );
                    },
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        direction: ShimmerDirection.ltr,
                        period: Duration(milliseconds: 1200),
                        child: Container(
                          width: double.infinity,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Text(
            movieTitle,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style:
                AppTextStyles.semiBold12(context).copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
