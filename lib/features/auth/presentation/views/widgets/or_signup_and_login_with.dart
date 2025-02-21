import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import 'package:movies_app/core/widgets/animated_text_cross_fading.dart';

import '../../manager/Auth_cubit/auth_cubit.dart';

class OrSignupAndLoginWith extends StatelessWidget {
  const OrSignupAndLoginWith({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final isSignup = context.watch<AuthCubit>().isSignup;
        return Row(
          spacing: 9,
          children: [
            Expanded(
              child: Divider(
                color: Colors.white.withValues(alpha: 0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: AnimatedTextCrossFading(
                crossFadeState: isSignup
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstText: "or Sign up with",
                secondText: "or Login with",
                firstTextStyle: AppTextStyles.medium16(context)
                    .copyWith(color: Colors.white),
                secondTextStyle: AppTextStyles.medium16(context)
                    .copyWith(color: Colors.white),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.white.withValues(alpha: 0.5),
              ),
            ),
          ],
        );
      },
    );
  }
}
