import 'package:flutter/material.dart';
import 'package:task_one/view/widgets/misc/task_progress_indicator.dart';
import 'package:task_one/view/widgets/pinned task card/pinned_task_component.dart';

import '../../../../model/task.dart';

class PinnedTaskBottomSection extends StatelessWidget {
  final Task task;
  const PinnedTaskBottomSection({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            children: [
              // To display the task components, we need to
              // loop through the task.components list and display each component using the PinnedTaskComponent widget.

              // ** Option 1: Using for loop **

              for (var taskComponent in task.components) ...[
                if (task.components.indexOf(taskComponent) != 0) const SizedBox(height: 4),
                PinnedTaskComponent(taskComponent: taskComponent),
              ]

              // ** Option 2: Using map **

              // ...task.components
              //     .map(
              //       (taskComponent) => Padding(
              //         padding: const EdgeInsets.only(top: 8),
              //         child: PinnedTaskComponent(taskComponent: taskComponent),
              //       ),
              //     )
              //     .toList(),
            ],
          ),
        ),
        TaskProgressIndicator(
          progress: task.progress,
          size: 60,
        )
      ],
    );
  }
}
