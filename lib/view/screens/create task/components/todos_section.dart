import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_one/constants/assets.dart';
import 'package:task_one/utils/validators.dart';
import 'package:task_one/view/widgets/input/input_field.dart';

class TodosSection extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final void Function(int) onRemove;
  const TodosSection({super.key, required this.controllers, required this.focusNodes, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'To-dos',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (var i = 0; i < controllers.length; i++) ...[
              InputField(
                controller: controllers[i],
                focusNode: focusNodes[i],
                hintText: 'ToDo ${i + 1}',
                prefix: SvgPicture.asset(AssetData.clipboardSvg),
                suffix: i != 0
                    ? IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: () => onRemove(i),
                      )
                    : null,
                validator: Validators.nonEmpty,
                onEditingComplete: () {
                  if (i + 1 != controllers.length) {
                    FocusScope.of(context).requestFocus(focusNodes[i + 1]);
                  }
                },
              ),
              if (i != controllers.length - 1) const SizedBox(height: 15),
            ]
          ],
        ),
      ],
    );
  }
}
