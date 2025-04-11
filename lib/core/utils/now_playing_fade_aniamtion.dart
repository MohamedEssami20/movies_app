import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingFadeAniamtion extends StatelessWidget {
  const NowPlayingFadeAniamtion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            direction: ShimmerDirection.ltr,
            enabled: true,
            period: Duration(seconds: 3),
            loop: 2,
            child: AspectRatio(
              aspectRatio: 1.6,
              child: Container(
                //height: 300,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
