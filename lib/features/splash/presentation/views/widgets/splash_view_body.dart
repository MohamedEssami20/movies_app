import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.assetsImagesSplahMovies,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 2,
            bottom: 0,
            right: 0,
            left: 0,
            child: Column(
              spacing: 20,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Movie Flix",
                      textStyle: AppTextStyles.robotoBold48(context),
                      speed: const Duration(milliseconds: 500),
                      curve: Curves.bounceIn,
                      cursor: "",
                    ),
                  ],
                  displayFullTextOnTap: true,
                  totalRepeatCount: 2,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    FadeAnimatedText(
                      'Movies at your fingertips.',
                      textStyle: AppTextStyles.regular16(context)
                          .copyWith(color: Colors.white),
                      duration: const Duration(milliseconds: 5000),
                      fadeInEnd: 0.7,
                      fadeOutBegin: 0.9,
                    ),
                  ],
                  displayFullTextOnTap: true,
                  totalRepeatCount: 2,
                  onFinished: () {
                    Navigator.of(context)
                        .pushReplacementNamed(OnBoardingView.routeName);
                  },
                ),
                CircularProgressIndicator(
                  color: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
