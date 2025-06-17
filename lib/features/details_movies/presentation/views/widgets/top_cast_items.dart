import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/api_end_points.dart';

import '../../../../../core/utils/app_text_styles.dart' show AppTextStyles;
import '../../../../../core/widgets/custom_shimmer_widget.dart';

class TopCastItems extends StatelessWidget {
  const TopCastItems(
      {super.key, required this.castImage, required this.castTiltle});
  final String castImage, castTiltle;
  @override
  Widget build(BuildContext context) {
    log("images of cast= ${ApiEndPoints.baseUrl + castImage} + castTiltle= $castTiltle");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        CircleAvatar(
          radius: 45,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: SizedBox(
              height: 90,
              width: 90,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: ApiEndPoints.imagebaseUrl + castImage,
                errorWidget: (context, url, error) {
                  return Icon(
                    Icons.error_outline,
                    color: Colors.black,
                  );
                },
                placeholder: (context, url) {
                  return CustomShimmer(
                    aspectRatio: 1.6,
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          textAlign: TextAlign.center,
          castTiltle,
          style: AppTextStyles.regular12(context).copyWith(color: Colors.white),
        )
      ],
    );
  }
}
