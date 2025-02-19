import 'package:flutter/material.dart';

class AnimatedTextCrossFading extends StatelessWidget {
  const AnimatedTextCrossFading({
    super.key,
    required this.crossFadeState,
    required this.firstText,
    required this.secondText,
  });

  final CrossFadeState crossFadeState;
  final String firstText, secondText;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Text(firstText),
      secondChild: Text(secondText),
      crossFadeState: crossFadeState,
      firstCurve: Curves.bounceInOut,
      secondCurve: Curves.linear,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
  }
}