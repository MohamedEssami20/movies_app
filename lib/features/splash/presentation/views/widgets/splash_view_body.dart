import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';

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
                Text(
                  "Movie Flix",
                  style: AppTextStyles.robotoBold48(context),
                ),
                Text(
                  'Movies at your fingertips.',
                  style: AppTextStyles.regular16(context)
                      .copyWith(color: Colors.white),
                ),
                CircularProgressIndicator(
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
