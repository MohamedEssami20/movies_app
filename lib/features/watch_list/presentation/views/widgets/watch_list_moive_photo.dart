import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WatchListMoivePhoto extends StatelessWidget {
  const WatchListMoivePhoto({
    super.key,
    required this.moviePoster,
  });
  final String moviePoster;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: SizedBox(
          height: 130,
          width: 124,
          child: CachedNetworkImage(
            imageUrl: moviePoster,
            memCacheHeight: 150,
            memCacheWidth: 124,
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
    );
  }
}
