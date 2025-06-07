import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import 'package:movies_app/core/utils/assets.dart';

class MoviesNotFound extends StatelessWidget {
  const MoviesNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 37, right: 37, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  // الخربشة فوق الرأس
                  Positioned(
                    top: -200,
                    left: 90,
                    bottom: 0,
                    child: SvgPicture.asset(
                      Assets.assetsImagesThinkFont,
                      //height: 40,
                    ),
                  ),

                  // الجسم
                  Positioned(
                    top: 80,
                    child: SvgPicture.asset(
                      Assets.assetsImagesBodyImage,
                      //height: 80,
                    ),
                  ),
                  // الرأس
                  Positioned(
                    top: 5,
                    left: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      Assets.assetsImagesHeadImage,
                      //height: 60,
                    ),
                  ),

                  // الطاولة
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 160,
                    child: SvgPicture.asset(
                      Assets.assetsImagesTableImage,
                      // height: 30,
                    ),
                  ),
                  // ظل اللاب توب
                  Positioned(
                    top: 170,
                    left: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      Assets.assetsImagesShadeLaptop,
                      //height: 60,
                    ),
                  ),
                  // اللابتوب
                  Positioned(
                    top: 120,
                    child: SvgPicture.asset(
                      Assets.assetsImagesLapTopImage,
                      //height: 60,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(child: const MoviesNotFoundDetails()),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class MoviesNotFoundDetails extends StatelessWidget {
  const MoviesNotFoundDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Text(
          'Not Found',
          style:
              AppTextStyles.semiBold24(context).copyWith(color: Colors.white),
        ),
        Expanded(
          child: Text(
            'We are sorry we cannot find the movie. \nWe are constantly updating the app to contain all what you want.',
            textAlign: TextAlign.center,
            style:
                AppTextStyles.regular16(context).copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
