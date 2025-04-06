import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/manager/text_field_cubit/text_field_cubit.dart';

String? validationPassword(String? value, BuildContext context) {
  final textFieldController = context.read<TextFieldCubit>();
  if (value!.isEmpty) {
    return "Please enter your password";
  } else if (value.isNotEmpty) {
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    } else if (textFieldController.signupPasswordController.text !=
        textFieldController.confirmPasswordController.text) {
      return "Password doesn't match";
    }
  }
  return null;
}
