import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';
import 'on_boarding_details.dart';

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
        Positioned(
          top: MediaQuery.sizeOf(context).height * 0.60,
          child: OnBoardingDetails(),
        ),
      ],
    );
  }
}
