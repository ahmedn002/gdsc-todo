import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TaskProgressIndicator extends StatelessWidget {
  final double progress;
  final double size;

  const TaskProgressIndicator({
    super.key,
    required this.progress,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Positioned.fill(
            child: CircularProgressIndicator(
              value: progress,
              backgroundColor: AppColors.darkElevation,
              strokeWidth: size / 7,
              strokeCap: StrokeCap.round,
            ),
          ),
          Center(
            child: Text(
              '${(progress * 100).toInt()}%',
              style: TextStyle(
                fontSize: size / 4,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
