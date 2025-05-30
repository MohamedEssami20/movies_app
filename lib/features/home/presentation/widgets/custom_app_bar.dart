import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/features/home/presentation/manager/home_search_cubit/home_search_cubit.dart';

import '../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: BlocBuilder<HomeSearchCubit, HomeSearchState>(
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
        ),
      ),
      actions: [
        BlocBuilder<HomeSearchCubit, HomeSearchState>(
          builder: (context, state) {
            return BlocBuilder<HomeSearchCubit, HomeSearchState>(
              builder: (context, state) {
                HomeStateNow homeStateNow = HomeStateNow.normal;
                if (state is HomeStateChanged) {
                  homeStateNow = state.mode;
                }
                return Visibility(
                  visible: homeStateNow == HomeStateNow.normal,
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
