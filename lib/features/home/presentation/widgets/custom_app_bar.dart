import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import 'package:movies_app/features/home/presentation/manager/bottom_bar_cubit/bottom_bar_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/home_search_cubit/home_search_cubit.dart';

import '../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: BlocBuilder<BottomBarCubit, int>(builder: (context, state) {
        if (state == 1) {
          return Text(
            "Watchlist",
            style: AppTextStyles.medium24(context).copyWith(
              color: Colors.white,
            ),
          );
        }
        if (state == 2) {
          return Text(
            "Download",
            style: AppTextStyles.medium24(context).copyWith(
              color: Colors.white,
            ),
          );
        }
        if (state == 3) {
          return Text(
            "Profile",
            style: AppTextStyles.medium24(context).copyWith(
              color: Colors.white,
            ),
          );
        }
        return SizedBox();
      }),
      leading: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: BlocBuilder<BottomBarCubit, int>(
          builder: (context, state) {
            if (state == 1 || state == 2 || state == 3) {
              return SizedBox();
            }
            return const LeadingWhenChangeSearchMode();
          },
        ),
      ),
      actions: [
        BlocBuilder<BottomBarCubit, int>(
          builder: (context, barState) {
            return BlocBuilder<HomeSearchCubit, HomeSearchState>(
              builder: (context, state) {
                HomeStateNow homeStateNow = HomeStateNow.normal;
                if (state is HomeStateChanged) {
                  homeStateNow = state.mode;
                }
                if (barState == 1 || barState == 2 || barState == 3) {
                  return SizedBox();
                }
                return Visibility(
                  visible: homeStateNow == HomeStateNow.normal || barState == 0,
                  child: IconButton(
                    padding: EdgeInsets.only(right: 25),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class LeadingWhenChangeSearchMode extends StatelessWidget {
  const LeadingWhenChangeSearchMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeSearchCubit, HomeSearchState>(
      builder: (context, state) {
        HomeStateNow homeStateNow = HomeStateNow.normal;
        if (state is HomeStateChanged) {
          homeStateNow = state.mode;
        }
        if (homeStateNow == HomeStateNow.search) {
          return IconButton(
            onPressed: () {
              context.read<HomeSearchCubit>().exitSearchMode();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 28,
              width: 40,
              child: SvgPicture.asset(
                Assets.assetsImagesMenuIcon,
                fit: BoxFit.scaleDown,
                // height: 20,
                // width: 30,
              ),
            ),
          );
        }
      },
    );
  }
}
