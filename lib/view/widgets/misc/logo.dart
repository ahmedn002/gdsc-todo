import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_one/constants/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/logo.svg',
          width: 35,
        ),
        const SizedBox(width: 10),
        const Text(
          'ToDo',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColors.titleGrey,
          ),
        ),
      ],
    );
  }
}
