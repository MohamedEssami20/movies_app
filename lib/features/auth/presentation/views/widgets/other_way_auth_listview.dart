import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'other_way_auth_item.dart';

class OtherWayAuthListView extends StatelessWidget {
  const OtherWayAuthListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: Platform.isAndroid ? 2 : 1,
          child: OtherWayAuthItem(
            image: Assets.assetsImagesGoogleIcon,
            title: "Google",
          ),
        ),
        Expanded(
          child: Visibility(
            maintainAnimation: true,
            maintainSize: true,
            maintainState: true,
            maintainSemantics: true,
            visible: Platform.isIOS,
            maintainInteractivity: true,
            child: OtherWayAuthItem(
                image: Assets.assetsImagesAppleIcon, title: "Apple"),
          ),
        ),
        Expanded(
          flex: Platform.isAndroid ? 2 : 1,
          child: OtherWayAuthItem(
            image: Assets.assetsImagesFacebookIcon,
            title: "Facebook",
          ),
        ),
      ],
    );
  }
}
