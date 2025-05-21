import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/func/custom_snack_bar.dart';
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
          showAnimatedSnackBar(
            context,
            message: "Signup Success",
            type: AnimatedSnackBarType.success,
          );
        }
        if (state is SignupFailure ||
            state is LoginWithGoogleFailure ||
            state is LoginWithFacebookFailure) {
          showAnimatedSnackBar(
            context,
            message: state is SignupFailure
                ? state.errorMessage
                : state is LoginWithGoogleFailure
                    ? state.errorMessage
                    : state is LoginWithFacebookFailure
                        ? state.errorMessage
                        : "there is an error, try later!",
            type: AnimatedSnackBarType.error,
          );
        }
      },
    );
  }
}
