import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_bloc_consumer/now_playing_bloc_consumer.dart';
import '../../../../core/utils/app_text_styles.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, left: 20, right: 20),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Now Playing",
            textAlign: TextAlign.left,
            style:
                AppTextStyles.semiBold16(context).copyWith(color: Colors.white),
          ),
          NowPlayingBlocConsumer(),
        ],
      ),
    );
  }
}
