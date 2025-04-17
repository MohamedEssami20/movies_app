import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/app_text_styles.dart';

class TrendingMoviesItem extends StatelessWidget {
  const TrendingMoviesItem({
    super.key,
    required this.imageUrl,
    required this.movieTitle,
    required this.isLoading,
  });
  final String imageUrl, movieTitle;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            child: SizedBox(
              height: 165,
              width: 150,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
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
          if (!isLoading)
            Text(
              movieTitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.semiBold12(context)
                  .copyWith(color: Colors.white),
            ),
        ],
      ),
    );
  }
}
