import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import 'logo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  final Widget? trailing;
  const CustomAppBar({super.key, this.text, this.trailing});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0, // This removes the default padding around the title to give it a precise value below
      backgroundColor: AppColors.background,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 27), // This adds the needed padding to the left of the title after removing the default padding
        child: text != null
            ? Text(
                text!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              )
            : const Logo(),
      ),
      actions: trailing != null ? [trailing!, const SizedBox(width: 27)] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
