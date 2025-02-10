import 'package:flutter/material.dart';
import 'on_boarding_indicator_listview.dart';
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
          OnBoardingIndicator(),
        ],
      ),
    );
  }
}
