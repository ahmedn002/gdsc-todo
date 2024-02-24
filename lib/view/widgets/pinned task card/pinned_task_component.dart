import 'package:flutter/material.dart';
import 'package:task_one/constants/colors.dart';
import 'package:task_one/model/task.dart';

class PinnedTaskComponent extends StatelessWidget {
  final TaskComponent taskComponent;
  const PinnedTaskComponent({super.key, required this.taskComponent});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          taskComponent.isDone ? Icons.check_circle_outline_rounded : Icons.radio_button_unchecked_rounded,
          color: taskComponent.isDone ? AppColors.green : AppColors.secondaryText,
        ),
        const SizedBox(width: 10),
        Text(
          taskComponent.name,
          style: TextStyle(
            fontSize: 16,
            color: taskComponent.isDone ? AppColors.green : AppColors.secondaryText,
          ),
        ),
      ],
    );
  }
}
