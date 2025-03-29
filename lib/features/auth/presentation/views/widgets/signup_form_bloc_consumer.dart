import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/build_success_snak_bar.dart';
import 'package:movies_app/core/widgets/custom_error_snak_bar.dart';

import '../../../../home/presentation/views/home_view.dart';
import '../../manager/Auth_cubit/auth_cubit.dart';
import 'signup_form.dart';

class SignupFormBlocConsumer extends StatelessWidget {
  const SignupFormBlocConsumer({super.key, required this.signupKey});
  final GlobalKey<FormState> signupKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return SignupForm(signupKey: signupKey);
      },
      listener: (context, state) {
        if (state is SignupSuccess ||
            state is LoginWithGoogleSuccess ||
            state is LoginWithFacebookSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeView.routeName, (_) => false);
          buildSuccessSnackBar(context, "signup Success!");
        }
        if (state is SignupFailure ||
            state is LoginWithGoogleFailure ||
            state is LoginWithFacebookFailure) {
          buildErrorSnackBar(
              context,
              state is SignupFailure
                  ? state.errorMessage
                  : state is LoginWithGoogleFailure
                      ? state.errorMessage
                      : state is LoginWithFacebookFailure
                          ? state.errorMessage
                          : "there is an error, try later!");
        }
      },
    );
  }
}
