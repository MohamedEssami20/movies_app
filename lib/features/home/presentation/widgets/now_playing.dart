import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/features/home/presentation/widgets/now_playing_header.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/assets.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, left: 20, right: 20),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Now Playing",
            textAlign: TextAlign.left,
            style:
                AppTextStyles.semiBold16(context).copyWith(color: Colors.white),
          ),
          Stack(
            children: [
              Image.asset(
                Assets.assetsImagesNowPlaying,
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.fill,
              ),
              NowPlayingHeader(),
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(
                  Assets.assetsImagesVideoIcon,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                ),
              ),
              Positioned(
                left: 0,
                bottom: 12,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Text(
                    'John Wick: Chapter 4',
                    style: AppTextStyles.semiBold16(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
