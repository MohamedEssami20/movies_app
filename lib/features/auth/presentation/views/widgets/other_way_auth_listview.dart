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
          child: OtherWayAuthItem(
            image: Assets.assetsImagesGoogleIcon,
            title: "Google",
          ),
        ),
        Visibility(
          visible: Platform.isIOS,
          child: Expanded(
            child: OtherWayAuthItem(
                image: Assets.assetsImagesAppleIcon, title: "Apple"),
          ),
        ),
        Expanded(
          child: OtherWayAuthItem(
            image: Assets.assetsImagesFacebookIcon,
            title: "Facebook",
          ),
        ),
      ],
    );
  }
}
