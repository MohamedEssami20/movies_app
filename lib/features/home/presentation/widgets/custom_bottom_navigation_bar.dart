import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/manager/bottom_bar_cubit/bottom_bar_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/manager/cubit/watch_list_movies_cubit.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, int>(
      builder: (context, state) {
        return Transform.translate(
          offset: const Offset(0, -15),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: StylishBottomBar(
              elevation: 0.0,
              backgroundColor: AppColors.kPrimaryColor,
              currentIndex: state,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              onTap: (index) {
                context.read<BottomBarCubit>().changeIndex(index);
                if (index == 1) {
                  context.read<WatchListMoviesCubit>().getWatchListMovies();
                }
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
      },
    );
  }
}
