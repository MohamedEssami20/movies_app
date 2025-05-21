import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/presentation/views/widgets/login_form.dart';
import '../../../../../core/func/custom_snack_bar.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../manager/Auth_cubit/auth_cubit.dart';

class LoginFormBlocConsumer extends StatelessWidget {
  const LoginFormBlocConsumer({super.key, required this.loginKey});
  final GlobalKey<FormState> loginKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return LoginForm(loginKey: loginKey);
      },
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeView.routeName, (_) => false);
          showAnimatedSnackBar(
            context,
            message: "Login Success",
            type: AnimatedSnackBarType.success,
          );
        }
        if (state is LoginFailure) {
          showAnimatedSnackBar(
            context,
            message: state.errorMessage,
            type: AnimatedSnackBarType.error,
          );
        }
      },
    );
  }
}
