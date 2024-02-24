import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_one/utils/validators.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../widgets/input/input_field.dart';

class TitleSection extends StatelessWidget {
  final TextEditingController controller;
  const TitleSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Task Title',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.primaryText),
        ),
        const SizedBox(height: 10),
        InputField(
          controller: controller,
          hintText: 'Title',
          prefix: SvgPicture.asset(AssetData.titleSvg),
          validator: Validators.nonEmpty,
        ),
      ],
    );
  }
}
