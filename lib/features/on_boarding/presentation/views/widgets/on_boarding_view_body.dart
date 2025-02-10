import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.assetsImagesOnBoardingBackground2,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
