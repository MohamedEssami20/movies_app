import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'on_boarding_text_list_view.dart';

class OnBoardingDetails extends StatelessWidget {
  const OnBoardingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          OnBoardingTextListView(),
          const SizedBox(height: 60),
          const OnBoardingIndicator(
            isActive: true,
          ),
        ],
      ),
    );
  }
}

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 24,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        3,
        (index) => OnBoardingIndicatorItem(
          isActive: isActive,
        ),
      ),
    );
  }
}

class OnBoardingIndicatorItem extends StatelessWidget {
  const OnBoardingIndicatorItem({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 8,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: isActive ? Color(0xFF8A0000) : Colors.white,
      ),
    );
  }
}
