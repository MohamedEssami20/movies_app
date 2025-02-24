import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/Auth_cubit/auth_cubit.dart';
import 'already_have_account.dart';
import 'donot_have_account.dart';

class AnimatedFooterAuth extends StatelessWidget {
  const AnimatedFooterAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final isSignup = context.watch<AuthCubit>().isSignup;
        return AnimatedCrossFade(
          firstChild: AlreadyHaveAccount(),
          secondChild: DonotHaveAccount(),
          crossFadeState:
              isSignup ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 400),
          firstCurve: Curves.bounceInOut,
          secondCurve: Curves.linear,
        );
      },
    );
  }
}
