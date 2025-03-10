import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        if(state is SignupFailure){
          CustomErrorSnackBar(message: state.errorMessage);
        }
        return  SignupForm(signupKey: signupKey,);
      },
      listener: (state, context) {
        if (state is SignupLoading) {
          const Center(
            child: CircularProgressIndicator(
              color: Colors.black12,
            ),
          );
        } else if (state is SignupSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              state, HomeView.routeName, (_) => false);
        } 
      },
    );
  }

}
