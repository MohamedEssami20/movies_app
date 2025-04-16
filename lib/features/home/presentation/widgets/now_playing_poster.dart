
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/api_end_points.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../core/widgets/custom_shimmer_widget.dart';
import '../../domain/entities/now_playing_entity.dart';
import 'now_playing_header.dart';

class NowPlayingPoster extends StatelessWidget {
  const NowPlayingPoster({
    super.key,
    required this.nowPlayingEntity,
  });
  final List<NowPlayingEntity> nowPlayingEntity;
  @override
  Widget build(BuildContext context) {
    final isLoading = nowPlayingEntity.isEmpty;
    return Stack(
      children: [
        isLoading
            ? CustomShimmer(
                aspectRatio: 1.6,
              )
            : CustomCachedNetworkImage(
                imageUrl: ApiEndPoints.imagebaseUrl +
                    nowPlayingEntity[0].movieImage.toString(),
              ),
        if (!isLoading)
          NowPlayingHeader(
            voteAvarage: nowPlayingEntity[0].voteAveragemovie,
          ),
        if (!isLoading)
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
        if (!isLoading)
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
    );
  }
}
