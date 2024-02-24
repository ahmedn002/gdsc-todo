import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_one/constants/assets.dart';
import 'package:task_one/constants/colors.dart';
import 'package:task_one/view/widgets/pinned task card/pinned_task_bottom_section.dart';

import '../../../model/task.dart';

class PinnedTaskCard extends StatelessWidget {
  final Task task;
  const PinnedTaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.elevation,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.title,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SvgPicture.asset(AssetData.pinSvg, width: 30),
                  ],
                ),
                const Divider(
                  color: AppColors.secondaryText,
                  endIndent: 50,
                  height: 16,
                ),
                PinnedTaskBottomSection(task: task)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
