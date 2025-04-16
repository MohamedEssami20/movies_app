import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/custom_shimmer_widget.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.scaleDown,
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
    );
  }
}