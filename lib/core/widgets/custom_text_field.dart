import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      required this.textInputAction,
      required this.textInputType,
      required this.obscureText,
      this.validate,
      this.suffix,
      this.controller,
      this.focusNode});
  final String label;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool obscureText;
  final String? Function(String?)? validate;
  final Widget? suffix;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      style: AppTextStyles.regular16(context).copyWith(
        color: Colors.white,
        decoration: TextDecoration.none,
      ),
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      focusNode: focusNode,
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      validator: validate,
      decoration: InputDecoration(
        suffixIcon: suffix,
        labelText: label,
        labelStyle: AppTextStyles.regular16(context).copyWith(
          color: Colors.white,
        ),
        errorStyle:
            AppTextStyles.regular16(context).copyWith(color: Colors.red),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: buildBorder(),
        errorBorder: buildBorder(Colors.red),
        focusedErrorBorder: buildBorder(Colors.red),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color? borderColor]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? Colors.white),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
  }
}
