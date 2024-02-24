import 'package:flutter/material.dart';
import 'package:task_one/constants/colors.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefix;
  final Widget? suffix;
  final String hintText;
  final String? Function(String?) validator;

  const InputField(
      {super.key,
      required this.controller,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.prefix,
      this.suffix,
      required this.hintText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        filled: true,
        fillColor: AppColors.darkElevation,
        focusedBorder: _getBorder(),
        focusedErrorBorder: _getBorder(isError: true),
        enabledBorder: _getBorder(),
        errorBorder: _getBorder(isError: true),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: prefix,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 22,
          minHeight: 22,
        ),
        suffixIcon: suffix,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 22,
          minHeight: 22,
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }

  InputBorder _getBorder({bool isError = false}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: isError ? 2 : 0,
        color: isError ? Colors.red : Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(100),
    );
  }
}
