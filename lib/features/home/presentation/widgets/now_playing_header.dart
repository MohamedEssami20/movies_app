import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';

class NowPlayingHeader extends StatelessWidget {
  const NowPlayingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 25,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              decoration: ShapeDecoration(
                color: const Color(0xFFFF0000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 20,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 2,
                children: [
                  Text(
                    'HD',
                    style: AppTextStyles.medium12(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //width: 25,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: ShapeDecoration(
                color: const Color(0xFFFF0000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 20,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 2,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 15,
                  ),
                  Text(
                    '8.5',
                    style: AppTextStyles.medium12(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
