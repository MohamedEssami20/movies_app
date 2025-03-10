import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/presentation/views/widgets/signup_form_bloc_consumer.dart';

import '../../manager/Auth_cubit/auth_cubit.dart';
import 'login_form.dart';

class AnimatedAuthForm extends StatelessWidget {
  const AnimatedAuthForm({super.key, required this.signupKey, required this.loginKey});
  final GlobalKey<FormState> signupKey;
  final GlobalKey<FormState> loginKey;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      final isSignup = context.read<AuthCubit>().isSignup;
      return AnimatedCrossFade(
        firstChild: SignupFormBlocConsumer(signupKey: signupKey,),
        secondChild: LoginForm(loginKey: loginKey,),
        crossFadeState:
            isSignup ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 400),
        firstCurve: Curves.bounceInOut,
        secondCurve: Curves.linear,
      );
    });
  }
}
