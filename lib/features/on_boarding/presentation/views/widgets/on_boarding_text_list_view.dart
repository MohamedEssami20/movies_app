import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class OnBoardingTextListView extends StatefulWidget {
  const OnBoardingTextListView({super.key});

  @override
  State<OnBoardingTextListView> createState() => _OnBoardingTextListViewState();
}

class _OnBoardingTextListViewState extends State<OnBoardingTextListView> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {});
      int currentPage = pageController.page!.round().toInt();
      print("Currnet page= $currentPage");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: SizedBox(
        height: 180,
        width: MediaQuery.sizeOf(context).width,
        child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Text(
                    'Downloads',
                    style: AppTextStyles.medium32(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Download movies and watch them offline\nat your own convenience',
                    style: AppTextStyles.regular16(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
