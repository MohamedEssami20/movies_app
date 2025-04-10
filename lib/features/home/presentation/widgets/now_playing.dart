import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/features/home/presentation/widgets/now_playing_header.dart';
import '../../../../core/utils/api_end_points.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../domain/entities/now_playing_entity.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key, required this.nowPlayingEntity});
  final List<NowPlayingEntity> nowPlayingEntity;
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
              CachedNetworkImage(
                imageUrl: ApiEndPoints.imagebaseUrl +
                    nowPlayingEntity[0].movieImage.toString(),
                fit: BoxFit.scaleDown,
                // width: double.infinity,
                errorWidget: (context, url, error) {
                  return Icon(
                    Icons.error_outline,
                    color: Colors.white,
                  );
                },
              ),
              NowPlayingHeader(
                voteAvarage: nowPlayingEntity[0].voteAveragemovie,
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(
                  Assets.assetsImagesVideoIcon,
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown,
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
                    nowPlayingEntity[0].movieTitle.toString(),
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
