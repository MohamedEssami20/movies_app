import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart' show AppTextStyles;
import '../../../../../core/widgets/custom_shimmer_widget.dart';

class TopCastItems extends StatelessWidget {
  const TopCastItems({super.key});

  @override
  Widget build(BuildContext context) {
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
                imageUrl:
                    "https://image.tmdb.org/t/p/original/izTspHKOpOAslVtlOsMv89o0rNe.jpg",
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
          "Lindsay LaVanch",
          style: AppTextStyles.regular12(context).copyWith(color: Colors.white),
        )
      ],
    );
  }
}
