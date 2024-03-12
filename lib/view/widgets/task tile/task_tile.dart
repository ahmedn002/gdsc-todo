import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:provider/provider.dart';
import 'package:task_one/constants/colors.dart';
import 'package:task_one/controllers/tasks_provider.dart';
import 'package:task_one/model/task.dart';
import 'package:task_one/view/widgets/misc/task_progress_indicator.dart';
import 'package:task_one/view/widgets/task%20tile/pie_menu_button.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.elevation,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Material(
        color: AppColors.elevation,
        child: PieMenu(
          onPressed: () => _showSnackBarMessageOnTap(context),
          onToggle: (isOpen) {
            if (isOpen) {
              // Vibrate
              HapticFeedback.mediumImpact();
            }
          },
          actions: [
            PieAction(
              tooltip: const Text('Delete'),
              onSelect: () => context.read<TasksProvider>().removeTask(task),
              child: const Icon(Icons.delete),
            ),
            PieAction(
              tooltip: const Text('Pin'),
              onSelect: () => context.read<TasksProvider>().pinTask(task),
              child: const Icon(Icons.push_pin),
            ),
          ],
          child: InkWell(
            onTap: () {},
            onLongPress: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 6, 5, 6),
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
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBarMessageOnTap(BuildContext context) {
    // Hide the previous message
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // Show the message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        shape: StadiumBorder(),
        backgroundColor: AppColors.darkElevation,
        content: Row(
          children: [
            Icon(Icons.info, color: AppColors.primaryText, size: 30),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Please hold and drag to select an action.',
                style: TextStyle(color: AppColors.primaryText, fontSize: 16, fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
