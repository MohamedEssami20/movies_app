import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/assets.dart';
import 'custom_details_movies_button.dart';

class WatchTrailerAndAddToWatchListButtons extends StatelessWidget {
  const WatchTrailerAndAddToWatchListButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: CustomDetailsMoviesButton(
            title: 'Watch Trailer',
            icon: SvgPicture.asset(
              Assets.assetsImagesVideoIcon,
              height: 20,
            ),
            color: Color(0xFF385A64),
            onPressed: () {},
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: CustomDetailsMoviesButton(
            title: 'Add to Watchlist',
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 20,
            ),
            color: Color(0xFF385A64),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
