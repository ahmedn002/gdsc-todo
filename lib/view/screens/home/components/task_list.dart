import 'package:flutter/material.dart';
import 'package:task_one/view/widgets/task%20tile/task_tile.dart';

import '../../../../model/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskTile(task: task);
      },
    );
  }
}
