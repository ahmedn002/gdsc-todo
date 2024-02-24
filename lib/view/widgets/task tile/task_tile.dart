import 'package:flutter/material.dart';
import 'package:task_one/constants/colors.dart';
import 'package:task_one/model/task.dart';
import 'package:task_one/view/widgets/misc/task_progress_indicator.dart';
import 'package:task_one/view/widgets/task%20tile/pie_menu_button.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 6, 5, 6),
      decoration: BoxDecoration(
        color: AppColors.elevation,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '${task.components.length} tasks',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
          const Spacer(),
          TaskProgressIndicator(progress: task.progress, size: 35),
          const SizedBox(width: 8),
          PieMenuButton(task: task),
        ],
      ),
    );
  }
}
