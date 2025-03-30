import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        child: GestureDetector(
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
        ),
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.only(right: 25),
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_sharp,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
