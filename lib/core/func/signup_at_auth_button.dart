
  import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import '../../features/auth/presentation/manager/text_field_cubit/text_field_cubit.dart';

void sigupAtAuthButton(BuildContext context) {
    final isSignupValid = context.read<TextFieldCubit>().validateSignupForm();
    if (isSignupValid) {
      final email = context.read<TextFieldCubit>().signupEmailController.text;
      final password =
          context.read<TextFieldCubit>().signupPasswordController.text;
      context.read<AuthCubit>().signup(
            email: email,
            password: password,
          );
    } else {
      context
          .read<TextFieldCubit>()
          .changeValidateSignupForm(validateMode: AutovalidateMode.always);
      log("not validte signup *****");
    }
  }
