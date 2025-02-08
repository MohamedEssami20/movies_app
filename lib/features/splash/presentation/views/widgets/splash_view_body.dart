import 'package:flutter/material.dart';

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
                  "Movies App",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
                CircularProgressIndicator(color: Colors.white,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
