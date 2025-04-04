import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -15),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: StylishBottomBar(
          elevation: 0.0,
          backgroundColor: AppColors.kPrimaryColor,
          currentIndex: currentIndex,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "Home",
                style: AppTextStyles.regular12(context),
              ),
              selectedColor: Colors.white,
              unSelectedColor: Colors.white.withValues(alpha: 0.5),
            ),
            BottomBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              title: Text(
                "Watchlist",
                style: AppTextStyles.regular12(context),
              ),
              selectedColor: Colors.white,
              unSelectedColor: Colors.white.withValues(alpha: 0.5),
            ),
            BottomBarItem(
              icon: Icon(Icons.download_outlined),
              title: Text(
                "Download",
                style: AppTextStyles.regular12(context),
              ),
              selectedColor: Colors.white,
              unSelectedColor: Colors.white.withValues(alpha: 0.5),
            ),
            BottomBarItem(
              icon: Icon(Icons.person),
              title: Text(
                "Profile",
                style: AppTextStyles.regular12(context),
              ),
              selectedColor: Colors.white,
              unSelectedColor: Colors.white.withValues(alpha: 0.5),
            ),
          ],
          option: AnimatedBarOptions(
            barAnimation: BarAnimation.blink,
            iconStyle: IconStyle.Default,
            padding: EdgeInsets.only(top: 8),
          ),
        ),
      ),
    );
  }
}
