import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      required this.textInputAction,
      required this.textInputType, required this.obscureText, this.validate, this.suffix});
  final String label;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool obscureText;
  final void Function(String?)? validate;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      style: AppTextStyles.regular16(context).copyWith(
        color: Colors.white,
        decoration: TextDecoration.none,
      ),
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffix,
        labelText: label,
        labelStyle: AppTextStyles.regular16(context).copyWith(
          color: Colors.white,
        ),
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
