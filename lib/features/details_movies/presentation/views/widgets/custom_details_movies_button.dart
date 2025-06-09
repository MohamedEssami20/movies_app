import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CustomDetailsMoviesButton extends StatelessWidget {
  const CustomDetailsMoviesButton({
    super.key,
    required this.color,
    required this.title,
    required this.icon,
    required this.onPressed,
  });
  final Color color;
  final String title;
  final Widget icon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        backgroundColor: color,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        spacing: 12,
        children: [
          Expanded(
            flex: 4,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: AppTextStyles.regular16(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: icon,
          )
        ],
      ),
    );
  }
}
