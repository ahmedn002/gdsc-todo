import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_one/constants/assets.dart';
import 'package:task_one/constants/routes.dart';
import 'package:task_one/view/widgets/actions/custom_button.dart';

import '../../../../model/task.dart';

class YourTasksSection extends StatelessWidget {
  final List<Task> tasks;
  const YourTasksSection({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Your Tasks',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        CustomButton(
          text: 'Add',
          icon: SvgPicture.asset(AssetData.addTaskSvg),
          onPressed: () => Navigator.pushNamed(context, Routes.createTask),
        )
      ],
    );
  }
}
