import 'package:flutter/material.dart';
import 'package:task_one/constants/assets.dart';
import 'package:task_one/constants/colors.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(AssetData.me),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Ahmed,',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'We wish you a productive day!',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.secondaryText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
