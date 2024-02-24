import 'package:flutter/material.dart';
import 'package:task_one/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Size? minimumSize;
  final void Function() onPressed;
  const CustomButton({super.key, required this.text, this.icon, required this.onPressed, this.minimumSize});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentDark,
        elevation: 0,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        minimumSize: minimumSize ?? const Size(130, 32),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null) const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.primaryText),
          ),
        ],
      ),
    );
  }
}
