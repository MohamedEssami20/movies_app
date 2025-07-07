import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CustomTrailerMovie extends StatefulWidget {
  const CustomTrailerMovie({super.key});

  @override
  State<CustomTrailerMovie> createState() => _CustomTrailerMovieState();
}

class _CustomTrailerMovieState extends State<CustomTrailerMovie>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;
  late YoutubePlayerController _youtubePlayercontroller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _youtubePlayercontroller = YoutubePlayerController(
      initialVideoId: 'kBskrYZfhw8',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        useHybridComposition: true,
        loop: true,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.reverse();
    _controller.dispose();
    _youtubePlayercontroller.pause();
    _youtubePlayercontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.6,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Container(
            decoration: ShapeDecoration(
              color: AppColors.kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(16),
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
                  "overview about this film is here overview about this film is here overview about this film is here",
                  style: AppTextStyles.regular16(context).copyWith(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
