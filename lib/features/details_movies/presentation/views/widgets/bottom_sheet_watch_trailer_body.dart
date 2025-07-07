import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/movies_details_entity/movie_trailer_entity.dart';

class WatchTrailerBottomSheetBody extends StatefulWidget {
  const WatchTrailerBottomSheetBody({
    super.key,
    required this.movieTrailerEntity,
    required this.movieName,
    required this.movieOverview,
  });
  final MovieTrailerEntity movieTrailerEntity;
  final String movieName, movieOverview;
  @override
  State<WatchTrailerBottomSheetBody> createState() =>
      _WatchTrailerBottomSheetBodyState();
}

late YoutubePlayerController _youtubePlayercontroller;

class _WatchTrailerBottomSheetBodyState
    extends State<WatchTrailerBottomSheetBody> {
  @override
  void initState() {
    super.initState();
    _initYoutubePlayerController();
  }

  // create method that init youtube player controller;
  void _initYoutubePlayerController() {
    _youtubePlayercontroller = YoutubePlayerController(
      initialVideoId: widget.movieTrailerEntity.movieKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        useHybridComposition: true,
        loop: true,
      ),
    );
  }

  @override
  void dispose() {
    _youtubePlayercontroller.pause();
    _youtubePlayercontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trailer',
            style: AppTextStyles.regular16(context).copyWith(
              color: Colors.white,
            ),
          ),
          Center(
            child: YoutubePlayer(
              controller: _youtubePlayercontroller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.white,
              progressColors: ProgressBarColors(
                playedColor: Colors.white,
                handleColor: Colors.white,
              ),
            ),
          ),
          Text(
            widget.movieName,
            style: AppTextStyles.regular24(context).copyWith(
              color: Colors.white,
            ),
          ),
          Text(
            widget.movieOverview,
            style: AppTextStyles.regular16(context).copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
