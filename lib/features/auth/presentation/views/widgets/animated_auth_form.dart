
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/Auth_cubit/auth_cubit.dart';
import 'login_form.dart';
import 'signup_form.dart';

class AnimatedAuthForm extends StatelessWidget {
  const AnimatedAuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context ,state){
      final isSignup = context.read<AuthCubit>().isSignup;
      return AnimatedCrossFade(
        firstChild: SignupForm(),
         secondChild: LoginForm(),
          crossFadeState: isSignup? CrossFadeState.showFirst : CrossFadeState.showSecond, 
          duration: const Duration(milliseconds: 400),
          firstCurve: Curves.bounceInOut,
          secondCurve: Curves.linear,
          );
    });
  }
}