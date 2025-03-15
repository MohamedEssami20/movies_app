import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/func/validation_password.dart';
import '../../../../../core/func/validation_email.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../manager/text_field_cubit/text_field_cubit.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required this.signupKey,
  });
  final GlobalKey<FormState> signupKey;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFieldCubit, TextFieldState>(
        builder: (context, state) {
      return Form(
        autovalidateMode: state.signupValidateMode,
        key: signupKey, // context.read<TextFieldCubit>().signupKey,
        child: Column(
          spacing: 30,
          children: [
            const SizedBox(
              height: 0,
            ),
            CustomTextField(
              controller: context.read<TextFieldCubit>().signupEmailController,
              label: "Email",
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
              validate: (value) {
                return validationEmail(value);
              },
            ),
            CustomTextField(
              controller:
                  context.read<TextFieldCubit>().signupPasswordController,
              label: "Password",
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.visiblePassword,
              obscureText: state.isSignupPasswordVisible,
              suffix: IconButton(
                onPressed: () {
                  context.read<TextFieldCubit>().changeVisiableSignupPassword(
                      isVisiable: !state.isSignupPasswordVisible);
                },
                icon: Icon(
                  state.isSignupPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
              validate: (value) {
                return validationPassword(value, context);
              },
            ),
            CustomTextField(
              controller:
                  context.read<TextFieldCubit>().confirmPasswordController,
              label: "Confirm Password",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              obscureText: state.isConfirmPasswordVisible,
              suffix: IconButton(
                onPressed: () {
                  context.read<TextFieldCubit>().changeVisiableConfirmPassword(
                      isVisiable: !state.isConfirmPasswordVisible);
                },
                icon: Icon(
                  state.isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
              validate: (value) {
                return validationPassword(value, context);
              },
            ),
          ],
        ),
      );
    });
  }
}
