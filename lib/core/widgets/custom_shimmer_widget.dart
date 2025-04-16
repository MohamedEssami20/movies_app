import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    required this.aspectRatio,
  });
  final double aspectRatio;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      direction: ShimmerDirection.ltr,
      period: Duration(milliseconds: 1200),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          width: double.infinity,
          color: Colors.white,
        ),
      ),
    );
  }
}
