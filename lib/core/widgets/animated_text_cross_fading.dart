import 'package:flutter/material.dart';

class AnimatedTextCrossFading extends StatelessWidget {
  const AnimatedTextCrossFading({
    super.key,
    required this.crossFadeState,
    required this.firstText,
    required this.secondText,
    this.firstTextStyle,
    this.secondTextStyle,
  });

  final CrossFadeState crossFadeState;
  final String firstText, secondText;
  final TextStyle? firstTextStyle, secondTextStyle;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Text(
        firstText,
        style: firstTextStyle,
      ),
      secondChild: Text(
        secondText,
        style: secondTextStyle,
      ),
      crossFadeState: crossFadeState,
      firstCurve: Curves.bounceInOut,
      secondCurve: Curves.linear,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
  }
}
